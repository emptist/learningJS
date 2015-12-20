## express
meteor 也許不是最合適用來做服務器端金融投資工具的.
所以嘗試一下express.

    fs = require 'fs'
    config = JSON.parse fs.readFileSync 'config.json'
    host = config.host
    port = config.port
    express = require 'express'

教程不少內容已經過時了,不跟了.
    >app = express.createServer()
現在用:

    app = express()
    app.use app.router # 新增; 先取得'/',在讀文件
    app.use express.static __dirname

    app.get '/', (request, response)->
      response.send '你好'

    app.listen port, host

測試成功
現在對該程序進行增補,新增部份註釋說明
