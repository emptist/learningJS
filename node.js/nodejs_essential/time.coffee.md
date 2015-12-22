## timeer

主要有: setTimeout, setInterval, clearInterval
這幾個function也是全局的可用的.

設置超時時間,可能會很有用.

時間都是以毫秒形式來處理的.我們設期限3秒鐘:
setTimeout 接受兩個參數 function 和一個期限,到期就執行那個function.

    期限 = 3000
    console.log '尚未過期...'

    回應 = ->
      console.log '已過期.'

    setTimeout 回應, 期限


在這期間程序是運行的.
可以用 setInterval 來間隔這段期限,他接受兩個參數,一個function,一個間隔時間,
每個間隔,就執行一次function參數.
我們半秒鐘提示一次時間,像秒錶:

    ###
    期限 = 3000
    秒錶 = 0
    間隙 = 500

    秒回 = ->
      秒錶 += 間隙
      console.log "已過#{秒錶/1000}秒..."

    setInterval 秒回,間隙

    console.log '尚未過期...'
    回應 = ->
      console.log '已過期.'
    setTimeout 回應, 期限
    ###

但是,以上的秒回開始工作之後,就不停讀秒了,如何停下秒錶?

用 clearInterval 來終止 setInterval所引發的反應:

    期限 = 3000
    秒錶 = 0
    間隙 = 500

    讀秒 = ->
      秒錶 += 間隙
      console.log "已過#{秒錶/1000}秒..."

    計時器 = setInterval 讀秒,間隙

    console.log '尚未過期...'

    回應 = ->
      clearInterval 計時器
      console.log '已過期.'

    setTimeout 回應, 期限

這樣就可以停止了.
最好始終都在同一行報告過了幾秒鐘.這需要將已經寫出的那一行清除內容,回到行首,重新寫過.
最好提示時間過了百分之多少.

    報百分比 = (百分比)->
      process.stdout.clearLine()
      process.stdout.cursorTo 0
      process.stdout.write "已過去 #{百分比}%"
還沒寫完
