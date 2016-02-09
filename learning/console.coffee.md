可以用console.error來蒐集錯誤報告,不用在程序中費事.
在Unix類系統中,0是輸入,1是輸出,2是錯誤,故只需:
```
coffee my.coffee 2 > error.log
```
即可完成錯誤蒐集.

    console.time('看速度')
    console.log '一切正常'
    console.time('warn&err')
    console.warn '小心了'
    console.error '出錯了'
    console.timeEnd('warn&err')
    console.info '有個消息告訴你哦'
    console.dir console #列出console的組成
    console.timeEnd('看速度')

以上只有 error 那句會通過 2 > 文件名 存入文件
