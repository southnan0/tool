import fs from 'fs'
import path from 'path'
import parseXlsx from 'excel'
import inquirer from 'inquirer'

const run = ()=>{
  inquirer.prompt([{
    type: 'input',
    message: '请输入需要转换的文件路径',
    name:'inputFilePath'
  },{
    type: 'input',
    message: '请输入生成excel的文件路径（默认与输入文件路径相同，默认文件名：result.json',
    name: 'outputFilePath'
  }]).then(({inputFilePath, outputFilePath})=>{
    const arr = []
    parseXlsx.default(inputFilePath, 1).then((data) => {
      data.map((item, rowIndex) => {
        if (rowIndex > 0) {
          const obj = {}
          data[0].forEach((key,index)=>{
            obj[key] = item[index]
          })
          arr.push(obj)
        }
      })
      fs.writeFile(outputFilePath || path.resolve(path.dirname(inputFilePath), './result.json'), JSON.stringify(arr), {
        encoding: 'utf8'
      }, (err) => {
        if (err) throw err
        console.log('done!')
      })
    })    
  })
}

run()


