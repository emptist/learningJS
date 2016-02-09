http = require 'http'
fs = require 'fs'
path = require 'path'

callback = (req, res)->
  console.log "#{req.method} request for #{req.url}"
  fpath = path.join __dirname,req.url

  if req.url is '/wiki.html'
    fstrm = fs.createReadStream fpath, 'utf8'
    res.writeHead 200, "Content-Type":"text/html"
    fstrm.pipe res

  else if req.url.match /.css$/
    fstrm = fs.createReadStream fpath, 'utf8'
    res.writeHead 200, "Content-Type": "text/css"
    fstrm.pipe res

  else if req.url.match /.jpg$/
    fstrm = fs.createReadStream fpath
    res.writeHead 200, "Content-Type": "image/jpeg"
    fstrm.pipe res

  else
    res.writeHead 404, "Content-Type":"text/plain"
    res.end "404 file not found#{fpath}"

http.createServer(callback).listen 3000

console.log 'Server listening ...'
