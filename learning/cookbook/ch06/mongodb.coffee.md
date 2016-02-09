# mongodb

取用mongdb模塊並連接本地安裝的數據庫test
> mongodb://[username:password@]host:port/database

    mongoClient=require('mongodb').MongoClient
    url= 'mongodb://127.0.0.1:27017/test'

callback的約定用法是,接受一個callback function,如果有error就會發給他,如果沒有就發null,data
給他,因此才有如下的檢測:

    ###
    mongoClient.connect url, (err, db)->
      # 除非 有: err
      if err?
        console.log err
        db.close()
      else
        console.log '連上數據庫了'
        db.close()
    ###

現在往數據庫裡面放collection
注意,配額不能寫成 15%,這個不是數字... 要寫 '15%'或0.15


    mongoClient.connect url, (err, db)->
      自選 = db.collection '自選'
      objs =
        [{代碼:'159915', 名稱:'創業板', 配額: 0.15}
        {代碼:'150153', 名稱: '創業板B', 配額: 0.15}
        {代碼: '150152', 名稱: '創業板A', 配額: 0.35}
        ]

      自選.insert objs,(錯, 果)->
        unless 錯?
          console.dir 果  # 注意用 dir
          db.close
        else
          console.log '正在insert',錯
          db.close()

讀取:

    mongoClient.connect url, (err, db)->
      自選 = db.collection '自選'
      自選.find().toArray (err, docs)->
        顯示 = (品種)->
          console.log """
            #{品種.代碼}\t#{品種.名稱}
            #{品種.配額}
          """
        顯示 品種 for 品種 in docs unless err?
        db.close()
