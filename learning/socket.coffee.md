## node.js socket programming

使用node.js 似乎更容易:
http://www.hacksparrow.com/tcp-socket-programming-in-node-js.html

現在嘗試寫一個 client 來連接 Python 接口:
經測試,連接沒問題,問題是速度慢.

    net = require('net')

    HOST = '127.0.0.1'
    PORT = 5555

    client = new net.Socket()

    client.connect PORT, HOST, (err, data) ->

        console.log('CONNECTED TO: ' + HOST + ':' + PORT)
        # Write a message to the socket as soon as the client is connected, the server will receive it as message from the client
        # client.write('simplePosition, ok')
        client.write('simplePosition')

Add a 'data' event handler for the client socket
data is what the server sent to this socket

    client.on 'data', (data)->
        console.log("DATA: #{JSON.stringify JSON.parse(data)}")
        # Close the client socket completely
        client.destroy()
        # data

Add a 'close' event handler for the client socket

    client.on 'close', ->
        console.log('Connection closed')

的確很容易.需要看視頻好好學一下node.
