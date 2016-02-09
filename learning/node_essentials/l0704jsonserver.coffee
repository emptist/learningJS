http = require 'http'
data = (require '../../package.json').dependencies

callback = (req, res)->
  res.writeHead 200, 'Content-Type':'text/json'
  res.end JSON.stringify list data

list = (res)->
  inlist = ({name, version} for name, version of data).filter (item)->
    item.version > '^0.31.1'

http.createServer(callback).listen 3000
console.log 'server listening 3000'
