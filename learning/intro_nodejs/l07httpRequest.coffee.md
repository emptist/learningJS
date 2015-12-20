教程老了,使用我自己的 request 那一篇
以下僅供參考

# try to send request to my own simpleServer but failed to work
  http = require "http"
  options =
    host: "127.0.0.1"
    port: 1337
    path: "./config.json"
    method: "GET"
    headers:
      'User-Agent':'emptist'

  request = http.request options, (response)->
    body = ''
    response.on "data", (chunk)-> # node split whole thing into chunks
      body += chunk.toString 'utf-8'
    response.on "end", ->
      console.log "body: #{body}"

  request.end()
