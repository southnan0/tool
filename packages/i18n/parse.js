const path = require('path')
const fs = require('fs')
var filename = path.resolve(__dirname, './parse.xlsx')
const zh = require('./zh-cn.js')

const parseXlsx = require('excel')

const setValue = (obj, mapObj) => {
  Object.keys(obj).forEach(key => {
    if (typeof obj[key] === 'string') {
      if (!mapObj[obj[key]]) {
        console.info(key, obj[key])
      } else {
        obj[key] = mapObj[obj[key]]
      }
    } else {
      setValue(obj[key], mapObj)
    }
  })
}

parseXlsx.default(filename, 1).then((data) => {
  const obj = {}

  data.filter((cItem, itemIndex) => itemIndex > 0).map(item => {
    obj[item[0]] = item[1]
  })

  setValue(zh, obj)

  fs.writeFile(`./en1.js`, JSON.stringify(zh), {
    encoding: 'utf8'
  }, (err) => {
    if (err) throw err
  })
})

