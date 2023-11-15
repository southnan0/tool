import json2xls from 'json2xls'
import fs from 'fs'
import path from 'path'
import inquirer from 'inquirer'
import readJsonFile from '../readJsonFile/index.js'

const run = ()=>{
  inquirer.prompt([{
    type: 'input',
    message: '请输入需要转换的文件路径',
    name:'inputFilePath'
  },{
    type: 'input',
    message: '请输入生成excel的文件路径（默认域输入文件路径相同，默认文件名：result.xlsx）',
    name: 'outputFilePath'
  },{
    type: 'input',
    message: '请输入key name，默认：key',
    name: 'keyName'
  },{
    type: 'input',
    message: '请输入value value，默认：value',
    name: 'valueName'
  }]).then(({inputFilePath, outputFilePath,keyName='key',valueName='value'})=>{
    const jsonData = readJsonFile(inputFilePath)
    const arr = []
    Object.keys(jsonData).forEach(key => {
      arr.push({
        [keyName]: key,
        [valueName]: jsonData[key]
      })
    })
    
    let xls = json2xls(arr)
    
    fs.writeFileSync(outputFilePath || path.resolve(path.dirname(inputFilePath), './result.xlsx'), xls, 'binary')
  })
}

run()
