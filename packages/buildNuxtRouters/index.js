const path = require('path');
const fs = require('fs');
const argv = require('yargs').argv;
const dirTree = require("directory-tree");

let outPath, fileName, dirPath;

if (!argv.p) {
    dirPath = path.resolve('./');
} else {
    dirPath = path.resolve(argv.p);
}

if (!argv.o) {
    outPath = path.resolve('./');
} else {
    outPath = path.resolve(argv.o);
}

if (!argv.f) {
    fileName = 'routes.js';
} else {
    fileName = argv.f;
}

const obj = dirTree(dirPath, {extensions: /.vue/});

const resetPath = (arr) => {
    return arr.filter(p => !(p.type === 'file' && p.name === 'index')).map((item) => {

        let itemPath = item.path;

        itemPath = itemPath.replace(/\\/g, '/')
            .replace(dirPath.replace(/\\/g, '/'), '')
            .replace('.vue', '');

        const reg = /^_(.*)/;
        const objItem = {
            name: itemPath.split('/').filter(p => p).map(p => p.replace(reg, '$1')).join('-'),
        };

        objItem.path = itemPath.split('/').map(p => p.replace(reg, ':$1?')).join('/');

        if(!objItem.path){
            objItem.path = '/';
        }

        objItem.noLoginRedirect = false;
        if (item.children) {
            objItem.children = resetPath(item.children);
        }

        return objItem;
    });
};

const arr = resetPath([obj]);

export default ()=>{
    fs.writeFileSync(path.resolve(outPath, fileName), `export default ${JSON.stringify(arr[0])}`);
}


