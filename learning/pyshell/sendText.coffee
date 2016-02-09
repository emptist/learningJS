Pysh = require 'python-shell'

#pysh = new Pysh 'echotext.py', {mode: 'text'}
pysh = new Pysh 'getStockId.py', {mode: 'text'}
#pysh = new Pysh 'HTSocket.py', {mode: 'text'}

pysh.send '159915'
pysh.on 'message', (data)->
  console.log data
  #console.log data.fetch_balance

pysh.end (err)->
  throw err if err
  #console.log err if err
  console.log 'finished'
