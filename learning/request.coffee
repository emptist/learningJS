https = require 'https'
fs = require 'fs'

options =
  hostname: 'en.wikipedia.org'
  port: 443
  path: '/wiki/Georg_Washington'
  method: 'GET'

req = https.request options, (resp)->
  responseBody= ''
  
  console.log "Response ..."
  console.log "Sever status: #{resp.statusCode}"
  console.log "Response Headers: %j",resp.headers

  resp.setEncoding "utf8"
  resp.once 'data', (chunk)->
    console.log chunk

  resp.on 'data', (chunk)->
    console.log "--chunk-- #{chunk.length}"
    responseBody += chunk

  resp.on 'end', ->
    fs.writeFile "wiki.html",responseBody,(err)->
      if err
        throw err
      console.log "file downloaded"

req.on 'err', (err)->
  console.log err

req.end() 
