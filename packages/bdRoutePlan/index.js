import data1 from './json/data1.json'
import data2 from './json/data2.json'
import data3 from './json/data3.json'
import data4 from './json/data4.json'
import axios from 'axios'
import json2xls from 'json2xls'
import path from 'path'
import fs from 'fs'

const all = [...data1, ...data2, ...data3, ...data4]
// const all = fail
import { fileURLToPath } from 'url'
const __filename = fileURLToPath(import.meta.url)

const __dirname = path.dirname(__filename)

// const resultFileName = path.resolve(__dirname, `../result/success_${new Date().getTime()}.xlsx`)

const getData = (url, { type, ...params }) => {
  const obj = {
    // departure_date: '20221026',
    departure_time: '09:00-12:00'
  }
  return axios.get(`${url}/${type}`, {
    timeout: 3500,
    params: {
      ...params,
      ret_coordtype: 'gcj02',
      coord_type: 'gcj02',
      ...(type === 'transit' ? obj : {
        tactics: 2,
        alternatives: 1
      })
    }
  })
}

const arrData = []
const arrFailed = []
const arrKey = ['klk72ji09d70nduqVC8iz4NYpHqnefT9', 'ea5MPum63OKSEhuMemIwt7cPyCiVZunx']
const cal = (arr) => {
  console.info('开始')
  const url = `https://api.map.baidu.com/direction/v2`
  // let arr = [...data1]
  // arr = [...data2]
  Promise.allSettled(arr.filter(item => {
    return item.id
  }).map((item) => getData(url, {
    origin: `${item.originLongitude},${item.originLatitude}`,
    destination: `${item.destinationLongitude},${item.estinationLatitude}`,
    ak: arrKey[1],
    type: item.type === '1' ? 'driving' : 'transit',
    id: item.id
  }))).then(res => {
    console.info('处理返回结果')
    res.forEach(({ status, value: res, reason }) => {
      const r = res?.data || {}
      const id = res?.config?.params?.id || reason?.config?.params?.id

      let currentUser = arr.find(user => user.id === id)
      currentUser = currentUser || {}
      if (!currentUser.id) {
        console.info(id, reason?.config?.params?.id)
      }
      if (r.result) {
        arrData.push({
          id,
          ...currentUser,
          message: r.message,
          transit_type: r.transit_type,
          baidu_type: r.type,
          routes: r.result?.routes?.length ? r.result.routes.map(item => {
            return {
              distance: item.distance,
              duration: item.duration
            }
          }) : [],
          distance: r.result?.routes?.[0]?.distance,
          duration: r.result?.routes?.[0]?.duration
        })
      } else {
        arrFailed.push(currentUser)
      }
    })

    console.info('成功条数：', arrData.length)
    console.info('失败条数：', arrFailed.length)
    if (arrData.length + arrFailed.length === all.length) {
      buildXlsxFile(arrData, path.resolve(__dirname, `./json/success_${new Date().getTime()}.xlsx`))
      buildJSONFile(arrFailed, path.resolve(__dirname, `./json/fail_${new Date().getTime()}.json`))
      buildJSONFile(arrData, path.resolve(__dirname, `./json/success_${new Date().getTime()}.json`))
    }
  }, (e) => {
    console.info(e)
  }).catch(e => {
    console.info(e)
  })
}

const buildXlsxFile = (data, fileName) => {
  const jsonArray = []
  data.forEach(function(item) {
    jsonArray.push({
      ...item,
      routes: JSON.stringify(item.routes),
      duration1: (item.duration / 60).toFixed(2)
    })
  })

  let xls = json2xls(jsonArray)

  fs.writeFileSync(fileName, xls, 'binary')
}

const buildJSONFile = (data, filename) => {
  fs.writeFile(filename, JSON.stringify(data), {
    encoding: 'utf8'
  }, (err) => {
    if (err) throw err
  })
}

const pageLen = 1000
for (let i = 0; i < Math.ceil(all.length / pageLen); i++) {
  setTimeout(() => {
    const end = (i + 1) * pageLen
    cal(all.slice(i * pageLen, end > all.length ? all.length : end))
  }, i * 1000)
}

