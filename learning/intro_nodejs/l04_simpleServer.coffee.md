## 簡單的服務器

用http這個庫很容易做一個服務器.
服務器需要一些參數,之前已經知道如何使用fs讀寫解析文件,那我們將參數存入config.json配置文件,在
此讀取使用.

```
coffee simpleServer.coffee
```

最简单的服务器,就是接到原来要输入的网址。然后在网页上显示你好。

    http = require 'http'
    fs = require 'fs'

    console.log 'starting'
    server = http.createServer (request, response)->
      console.log "received request: #{request.url}"
      response.writeHead 200, {"content-type": "text/plain"}
      response.end "你好,Hello world"

      ###
      config = JSON.parse fs.readFileSync "config.json"

      {host, port} = config  # "127.0.0.1"
      server.listen port, host, ->
        console.log "now listening #{host} : #{port}"
      ###

這是最簡單的服務器,去掉註釋即可運行.

做一個文件服務器也很簡單.在地址欄,域名之後輸入斜槓加文件名,服務器取得url取得文件名,查看該文件,
如果不存在就報404文件找不到,否則就讀取文件內容並發送給客戶.

      fs.readFile ".#{request.url}", (error, data)->
        if error # send a 404 page
          response.writeHead 404, {"content-type": "text/plain"}
          response.end "Sorry, the page not found."
        else
          response.writeHead 200, {"content-type": "text/plain"}
          response.end data

要運行上述服務器,都需要設置參數,聽取客戶發來的請求.以下讀取配置文件,取得網址和端口.

    {host, port} = JSON.parse fs.readFileSync "config.json"

讓服務器程序聽取該網址端口的請求,先端口,後主機:

    server.listen port, host, ->
      console.log "now listening #{host} : #{port}"

配置文件可以隨時改動,一旦改動則重啟服務器:

    fs.watchFile "config.json", (現, 前)->
      {host, port} = JSON.parse fs.readFileSync "config.json"
      server.close() # nesh dosn't close the old server?
      server.listen port, host, ->
        console.log "now listening #{host} : #{port}"
