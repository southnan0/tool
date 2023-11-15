#!/usr/bin/env node
const chalk = require('chalk');
const clear = require('clear');
const figlet = require('figlet');

const github = require('./lib/github');
const repo = require('./lib/repo');
const files = require('./lib/files');

/**
 * 1. init clone一个项目，执行npm istall  build  pm2 start
 * 2. 如果是全新的服务器，需要安装node  npm  pm2 等
 * 3. 如果已部署过项目，需要更新项目并重新发布
 */

clear();
console.log(chalk.magenta('欢迎使用圆医项目初始化构建工具，请先确保你有圆医代码的git权限!'))
console.log(
    chalk.yellow(
        figlet.textSync('southnan0', {horizontalLayout: 'full'})
    )
)

// program
//     .option('-u, --url <url>', 'url')
//     .action(function () {
//         console.info(arguments)
//     })
//     .parse(process.argv);
//
// if (program.url) {
//     console.info(program.url)
// }

const getGithubToken = async () => {
    // Fetch token from config store
    let token = github.getStoredGithubToken();
    if (token) {
        return token;
    }

    // No token found, use credentials to access github account
    await github.setGithubCredentials();

    // Check if access token for ginit was registered
    const accessToken = await github.hasAccessToken();
    if (accessToken) {
        console.log(chalk.yellow('An existing access token has been found!'));
        // ask user to regenerate a new token
        token = await github.regenerateNewToken(accessToken.id);
        return token;
    }

    // No access token found, register one now
    token = await github.registerNewToken();
    return token;
}

const run = async () => {
    try {
        const token = await getGithubToken();
        github.githubAuth(token);

        repo.updateRepo();

    } catch (err) {
        if (err) {
            switch (err.code) {
                case 401:
                    console.log(chalk.red('Couldn\'t log you in. Please provide correct credentials/token.'));
                    break;
                case 422:
                    console.log(chalk.red('There already exists a remote repository with the same name'));
                    break;
                default:
                    console.log(err);
            }
        }
    }
}

run()
