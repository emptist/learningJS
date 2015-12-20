## Mongodb

為l06的服務器增加數據庫.用Mongodb.

### 下載安裝
Mongodb本身和node.js的相應模塊是不一樣的,需要分別安裝.

到 https://Mongodb.org 下載安裝 Mongodb本身.
然後:
```
npm install -g mongodb
```
### 使用 Mongodb
我網絡差下載困難,就用 Meteor自帶的來學習了, 從原始版本中借用代碼做些改動:

      mongo = require 'mongodb'
      host = '127.0.0.1'
      port = '3001'
      db = new mongo.Db 'db-name', new mongo.Server host, port, {}
      db.open (err)->
        console.log "已連接 #{host} #{port}"
        db.collection "user", (err, collection)->
          console.log '我們有一個集子了'
          collection.insert
            id:'2'
            name: 'jim ko'
            twitter: 'no'

            ->
            console.log  '已經增加記錄'
            collection.find 'id':'1', (err, cursor)->
              cursor.toArray (err, users)->
                if users.length is 0
                  console.log 'no user yet'
                else
                  console.log "找到一個#{users[0]}"

以上是原始的教程,接下來他教了將其編成一個function來用.
我將另開一個文件來嘗試從Meteor數據庫讀寫.
