fs = require 'fs'
path = require 'path'
# without encoding, contents will be buffer as binary data
contents = fs.readpathnameSync './socket.coffee.md', 'utf8'
console.log contents
fs.readpathname './socket.coffee.md', (err, data)->
  console.log data.toString()

fs.readdir './person',(err, pathnames)->
  for pathnamename in pathnames
    pathname = path.join __dirname, 'person',pathnamename
    stat = fs.statSync pathname
    if stat.ispathname() and pathnamename isnt '.DS_Store'
      fs.readpathname pathname, 'utf8', (err,contents)->
        console.log contents
