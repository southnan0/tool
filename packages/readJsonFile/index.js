import fs from 'fs'

export default (filePath)=>{
    const str = fs.readFileSync(filePath,'utf-8')

    let jsonData = {}
    try{
        jsonData = JSON.parse(str)
    }catch(e){
        console.info(e)
    }
    
    return jsonData
}