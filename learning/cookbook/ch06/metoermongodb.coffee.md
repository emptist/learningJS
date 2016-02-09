# mongodb

## 連接 meteor mongodb
剛在coffee命令行測試了一下可行.

    mongoClient = require('mongodb').MongoClient
    url = 'mongodb://localhost:3001/meteor'
    mongoClient.connect url, (err, db) ->
      unless err?
        console.log '連接成功'
      else
        console.log err
      db.close()

連接成功.
試試新建一個collection,注意mongodb的地址寫法;meteor mongodb的端口用3001:

    mongoClient = require('mongodb').MongoClient
    url = 'mongodb://localhost:3001/meteor'

連接數據庫,增加一個collection,在其中加入一法:

    mongoClient.connect url, (err, db) ->
      marketInfo = db.collection 'marketInfo'
      marketInfo.insert {代碼:'159915',名稱:'創業板', 性質: 'ETF'}, (err, result)->
        unless err?
          console.dir result
        else
          console.log err
        db.close()

測試通過.

讀取數據:

    mongoClient.connect url, (err, db) ->
      marketInfo = db.collection 'marketInfo'
      console.log marketInfo.find().toArray (err, docs)->
        console.log "All"
      db.close
