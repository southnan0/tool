const parseXlsx = require('excel')
const path = require('path')
const json2xls = require("json2xls")
const fs = require("fs")

const arr = ['id', 'name', 'json', 'code', 'time']
const filename = path.resolve(__dirname, './logs.xlsx')
parseXlsx.default(filename, '1').then((data) => {
  const resultData = data.filter((cItem, itemIndex) => itemIndex > 0).map(item => {
    const obj = {}

    item.forEach((value, index) => {
      obj[arr[index]] = value
    })
    const json = JSON.parse(obj.json)
    return {
      ...json.userSystemInfo || {},
      name: obj.name
    }
  })

  let xls = json2xls(resultData)

  fs.writeFileSync(path.resolve(__dirname, './result.xlsx'), xls, 'binary')
})
