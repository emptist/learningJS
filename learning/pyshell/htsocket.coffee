Pysh = require 'python-shell'

###
  經過測試,簡單的任務可以完成,但是長時間的相互傳遞可能不行.
###

options =
  mode: 'text' # or json or binary
  scriptPath: './'

pysh = new Pysh process.argv[2] ? 'HTSocket.py', options

#pysh.send '159915'
pysh.on 'message', (data)->
  console.log data
  if data[0] is '{'
    json = JSON.parse (data.replace /\'/g,'"')
    #json = eval "(" + data + ")"
    console.log json
    console.log k,v for k,v of json

pysh.end (err)->
  throw err if err
  #console.log err if err
  console.log 'finished'
