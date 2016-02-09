Server = require('ws').Server
wss = new Server port:3333

wss.on 'connection',(ws)->
  ws.on 'message', (message)->
    if message is 'exit'
      ws.close()
    else
      for each in wss.clients
        each.send message
  ws.send 'Welcome'
