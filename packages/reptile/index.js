var express = require('express');
var cheerio = require('cheerio');
var superagent = require('superagent');

var app = express();
const url = 'http://wiki.hd/pages/viewpage.action?pageId=13341913'

app.get('/', function (req, res, next) {
    superagent.get(url)
        .end(function (err, sres) {
            if (err) {
                return next(err);
            }
            // console.info(sres.text)
            var $ = cheerio.load(sres.text);
            var items = [];
            $('.confluenceTable').each(function (idx, element) {
                console.info(element)
                var $element = $(element);
                items.push({
                    title: $element.innerText,
                    // href: $element.attr('href')
                });
            });

            res.send(sres.text);
        });
});

const port = 3003
app.listen(port, function () {
    console.log(`app is listening at port ${port}`);
});
