fs = require 'fs'

if fs.existsSync 'lib'
  console.log 'directory exists'
else
  fs.mkdir 'lib', (err)->
    if err?
      console.error err
    else
      console.log 'created'
