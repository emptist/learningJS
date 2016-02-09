Pysh = require 'python-shell'
options =
  mode: 'binary'
  scriptPath: './'

pysh = new Pysh 'echobinary.py', options
output = ''
pysh.stdout.on 'data', (data)->
  output += ''+data

pysh.send new Buffer '300388'

pysh.end (err)->
  throw err if err
  #console.log err if err
  console.log output
