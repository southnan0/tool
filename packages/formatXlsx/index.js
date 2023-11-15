const XLSX = require('xlsx');
const path = require('path');

const filePath = path.resolve(__dirname, './test.xlsx');
const workbook = XLSX.readFile(filePath);
const workSheet = workbook.Sheets['菜单表'];

const merge = workSheet['!merges'];
const ref = workSheet['!ref'];

const regexWord = /[A-Z]/gi;
const regexNum = /\d/gi;
const arrSheet = [];
const objSheet = {};

// c word  r num
const arrRange = [{s: {c: 0, r: 1}, e: {c: 3, r: 4}}];
var arr = [];
for (var i = 65; i < 91; i++) {
    arr.push(String.fromCharCode(i));
}

Object.keys(workSheet).map((key)=> {

    if (key.match('!')) {
        if (key === '!ref') {
            objSheet[key] = arr[arrRange[0].s.c] + '' + (arrRange[0].s.r + 1) + ':' + arr[arrRange[0].e.c] + '' + (arrRange[0].e.r + 1);
        }
        else if (key === '!merges') {
            // merge.map(item=>{
            //     //is in the range
            //     const min
            //     if(item.s.c<arrRange[0].s.c && item.s.r<arrRange[0].s.r && item.e.c>)
            // })
            objSheet[key] = workSheet[key].slice(1, 3);
        } else {
            objSheet[key] = workSheet[key];
        }
        return;
    }

    const c = arr.indexOf(key.match(regexWord).join(''));
    const r = key.match(regexNum).join('');
    if (c >= arrRange[0].s.c && c <= arrRange[0].e.c && r-1 >= arrRange[0].s.r && r-1 <= arrRange[0].e.r) {
        merge.map(item=> {
            if (item.s.c <= c && item.s.r <= r-1 && item.e.c >= c && item.e.r >= r-1) {
                const cGap = item.e.c - item.s.c;
                const rGap = item.e.r - item.s.r;
                console.info(rGap)
                if (cGap !== 0 && rGap !== 0) {
                    for (var i = 0; i <= cGap; i++) {
                        for (var j = 0; j <= rGap; j++) {
                            objSheet[`${arr[item.s.c + i]}${item.s.r + 1 + j}`] = workSheet[key];
                        }
                    }
                } else if (rGap !== 0) {
                    for (var j = 0; j <= rGap; j++) {
                        console.info(item)
                        objSheet[`${arr[item.s.c]}${item.s.r + 1 + j}`] = workSheet[key];
                    }
                } else if (cGap !== 0) {
                    for (var i = 0; i <= cGap; i++) {
                        objSheet[`${arr[item.s.c + i]}${item.s.r + 1}`] = workSheet[key];
                    }
                }


            }
        });

        objSheet[key] = workSheet[key];
    }
});

// console.info(objSheet)

const json = XLSX.utils.sheet_to_json(objSheet);
console.info(json)


// console.info(merge)
