fs = require 'fs'

try
  fs.unlinkSync './lib/nothing.json'
catch error
  console.log error

fs.unlink 'nothing.md', (err)->
  if err?
    console.log err
    # 如果throw就會退出進程了
    # throw err
  else
    console.log 'removed'
