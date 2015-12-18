###
To run this:
nesh -ce simpleServer.coffee
###
http = require 'http'
fs = require 'fs'
console.log 'starting'
config = JSON.parse fs.readFileSync "config.json"
{host, port} = config  # "127.0.0.1"
server = http.createServer (request, response)->
  console.log "received request: #{request.url}"
  fs.readFile ".#{request.url}", (error, data)->
    if error # send a 404 page
      response.writeHead 404, {"content-type": "text/plain"}
      response.end "Sorry, the page not found."
    else
      response.writeHead 200, {"content-type": "text/plain"}
      response.end data
  #response.writeHead 200, {"content-type": "text/plain"}
  #response.end "Hello world"

server.listen port, host, ->
  console.log "now listening #{host} : #{port}"
fs.watchFile "config.json", ->
  config = JSON.parse fs.readFileSync "config.json"
  server.close() # nesh dosn't close the old server?
  {host, port} = config  # "127.0.0.1"
  server.listen port, host, ->
    console.log "now listening #{host} : #{port}"
