express = require 'express'
http = require 'http'

app = express()
server = http.createServer(app).listen 3000

io = (require 'socket.io')(server)

app.use express.static './public'
io.on 'connection', (socket)->
  socket.on 'chat', (message)->
    socket.broadcast.emit 'message',message

  socket.emit 'message','welcome...'

console.log 'starting.....'
