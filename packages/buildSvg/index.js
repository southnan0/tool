import inquirer from 'inquirer'
import { svgBuilder } from "./svgBuilder.js";

const showPrompt = ()=>{
  inquirer.prompt([{
    type: 'input',
    message: '请输入svg文件夹地址',
    name: 'filePath'
  }]).then(({filePath})=>{
    svgBuilder(filePath)
  }).catch(error=>{
    if(error.code === 'ENOENT'){
      showPrompt()
    }else{
      console.info(error)
    }
  })
}

showPrompt()