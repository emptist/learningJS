Pysh = require 'python-shell'

pysh = new Pysh 'echojson.py', {mode: 'json'}

pysh.send {code:'300388'}
pysh.on 'message', (data)->
  console.log data

pysh.end (err)->
  throw err if err
  #console.log err if err
  console.log 'finished'
