現在嘗試寫一個 client 來連接 百度 取得IP地址:
```
  net = require('net')

  HOST = 'baidu.com'
  PORT = 80

  client = new net.Socket()

  client.connect PORT, HOST, (error) ->
    console.log('CONNECTED TO: ' + HOST + ':' + PORT)
    # Write a message to the socket as soon as the client is connected, the server will receive it as message from the client
    client.write('hello')
    console.log "ip: #{client._getsockname().address}"
    client.destroy()

  # Add a 'close' event handler for the client socket
  client.on 'close', ->
    console.log('Connection closed')
```

但以上取得的是192.168.1.101,不是真正ip地址

## 從網站取得

    request = require 'request'
    options =
      url: 'http://freegeoip.net/json/'
      json: true

    getIP = -> request options, (err, response, json)->
      unless err
        console.log json.ip
        json.ip

    getIP()

    #console.log getIP()
