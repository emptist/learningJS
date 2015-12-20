# try to send request to my own simpleServer but failed to work
https = require "https"
username = "emptist"
head =
  "User-Agent": "emptist"
  method: "HEAD"

options =
  host: "api.github.com"
  path: "user/#{username}/repos"
  method: "GET"

request = https.request head, options, (response)->
  body = ''
  response.on "data", (chunk)-> # node split whole thing into chunks
    body += chunk.toString 'utf-8'
  response.on "end", ->
    console.log "body: #{body}"

request.end()
