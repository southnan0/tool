import fs from 'fs';
import path from 'path';
const oldJson = {
    "T4a0eb60": "Please complete goal setting before {date}"
  }
  
  const notLowerList = ['are', 'the', 'at', 'for', 'of', 'or', 'in', 'be', 'to', 'and']


  const isOverOneUpper = (str)=>{
    const arrWord = str.split(' ');
    const upperWordList = arrWord.filter(word=>!!word.trim()).filter(word=>word.slice(0,1) === word.slice(0,1).toUpperCase())
    return upperWordList.length >1
  }

  const toEachWordUpper = (str)=>{
    const arrWord = str.split(' ');
    const upperWordList = arrWord.map(word=>notLowerList.includes(word) ? word : word.slice(0,1).toUpperCase() + word.slice(1))
    return upperWordList.join(' ')
  }

  const compare = ()=>{
    Object.keys(newJson).forEach(key=>{
        if(oldJson[key] && oldJson[key] !== newJson[key]){
            // 如果就值有多个字母大写，那么新值也要
            if(isOverOneUpper(oldJson[key]) && !isOverOneUpper(newJson[key])){
                newJson[key] = toEachWordUpper(newJson[key])
            }
        }
    })
  }
  compare()
  fs.writeFile(path.resolve('./result1.json'), JSON.stringify(newJson), {
    encoding: 'utf8'
  }, (err) => {
    if (err) throw err
    console.log('done!')
  })