/**
 * 根据特定模板生成对应文件
 */

const path = require('path');
const fs = require('fs');

const outPutPath = '../components/common/icon/';
const templatePath = '../components/common/icon/template.vue';
const imgDirPath = '../assets/img/icon';
const arrFile = fs.readdirSync(path.resolve(__dirname, imgDirPath));

const template = fs.readFileSync(path.resolve(__dirname, templatePath)).toString();

arrFile.forEach(fileName => {
    const name = fileName.replace('.svg', '');
    const str = template.replace('$$name$$', name);
    fs.writeFile(path.resolve(__dirname, outPutPath + name + '.vue'), str, (err) => {
        if (err) {
            console.info(err)
        }
    })
});

// console.info(arrFile)
