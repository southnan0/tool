const fs = require('fs')
const en = {}
const zh = require('./zh-cn.js')

const resultObj = []

const getValue = (obj, enObj) => {
  Object.keys(obj).forEach(key => {
    if (typeof obj[key] === 'string') {
      if (!enObj) {
        console.info(key)
      }
      resultObj.push({
        zh: obj[key],
        cn: enObj?.[key] || ''
      })
    } else {
      getValue(obj[key], enObj[key] || '')
    }
  })
}

getValue(zh, en)
fs.writeFile(`./i18n.json`, JSON.stringify(resultObj), {
  encoding: 'utf8'
}, (err) => {
  if (err) throw err
})
