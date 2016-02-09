wss = new require('ws').Server port:3333

wss.on 'connection',(ws)->
  ws.send 'Welcome'

