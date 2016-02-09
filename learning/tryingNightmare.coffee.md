# nightmare
沒掌握request登錄華泰,所以測試一下其他方法.

    Nm = require 'nightmare'
    google = new Nm()
      .useragent 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36'
      .goto 'http://google.com'
      .wait()
      .screenshot 'google.png'
      .run (e,nm)->
        return console.log e if e
        console.log 'done'
