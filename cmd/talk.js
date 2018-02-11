#!/usr/bin/env node

// const program = require('commander')
//
// program
//     .version('0.1.0')
//     .command('show your name <name>', '输入你的名字')
//     .action(function () {
//         console.info(arguments)
//     })

process.stdin.resume();
process.stdin.setEncoding('utf8');
console.info('请输入你的姓名：')
process.stdin.on('data', function(data) {
    process.stdout.write('你的姓名：'+data);
    process.exit(0);
});
