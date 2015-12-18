# try to send request to my own simpleServer but failed to work
http = require "http"
options =
  host: "127.0.0.1"
  port: 1337
  path: "./config.json"
  method: "GET"

request = http.request options, (response)->
  body = ''
  response.on "data", (chunk)-> # node split whole thing into chunks
    body += chunk.toString 'utf-8'
  response.on "end", ->
    console.log "body: #{body}"

request.end()
