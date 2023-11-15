
import path from 'path'
import inquirer from 'inquirer'
import translate from './translate.js'
import buildJSONFile from '../buildJsonFile/index.js'
import readJsonFile from '../readJsonFile/index.js'
import ora from 'ora'

inquirer.prompt([{
    type: 'input',
    message: '请输入需要转换的文件路径 .json',
    name: 'inputFilePath'
},{
    type: 'input',
    message: '请输入导出的文件路径（默认与输入文件路径相同，默认文件名：result.json',
    name: 'outputFilePath'
  }]).then(({inputFilePath,outputFilePath})=>{

    const spinner = ora('Loading').start()
    const data = readJsonFile(inputFilePath)

    const obj = {}
    Object.keys(data).forEach((key,index) => {
        setTimeout(async()=>{
            obj[key] = await translate(data[key], 'zh', 'en')
            spinner.text = key
            if (Object.keys(obj).length === Object.keys(data).length) {
                spinner.stop()
                buildJSONFile(obj, outputFilePath || path.resolve(path.dirname(inputFilePath), './data_en.json'))
            }
        }, index * 200)
    })
})





