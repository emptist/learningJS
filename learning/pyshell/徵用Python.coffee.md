# 徵用Python

## 目的
Python 資源眾多, Pandas 有用. 但不想以之為主, 所以從 Coffee 中去徵用他就可以.

## 找庫
找到了三個庫, 上 npmjs.org 搜索 python 可以找到很多,其中三個跟本話題有關. 又其中以
[Python-shell](https://www.npmjs.com/package/python-shell) 下載人數多. 故先
測試.測試依據上述頁面上的指導.

## Python-shell

安裝:
  ```
    npm install python-shell
  ```
測試:
先寫了一個 hello.py 內容為 print('hello, coffee'),放在當前目錄下了.


  ```coffeescript

    Pysh = require 'python-shell'

    # 簡單用法:
    #Pysh.run 'hello.py',(err)->
    #  throw err if err
    #  console.log 'finished'

    # 互相傳遞資料很容易,通過 stdin/stdout/stderr

    pysh = new Pysh 'hello.py'

    pysh.on 'message', (data)->
      console.log data

    pysh.end (err)->
      #throw err if err
      console.log err if err
      console.log 'finished'
  ```

測試成功.再做更複雜點的測試.設置一些選項.
如何交互收發信息呢? [參閱](https://github.com/extrabacon/python-shell/issues/16)

    ###
    選項 =
      mode: 'json'
      pythonPath: 'Python位置'
      pythonOptions: ['-u']
      scriptPath:'.'
      args:[變量]
    ###

經過測試, tushare 庫 有一個 _write_head() _write_tips() 和 _write_console()
會污染stdout, 文件為: tushare/stock/cons.py, 須將這些function 全部 加 pass 註釋掉代碼

然後, 在python一側寫

  ```
  import sys
  import tushare as ts
  import json

  data = ts.get_h_data('300388').to_json()
  print(data)
  ```

共有三種mode,text,json,binary.
注意在此用了 text選項來接收,然後再用JSON.parse來手工解析.
用 mode:'json' 直接解析或用binary都會出錯.

    Pysh.run 'getStock.py', {mode: 'text'}, (故障, 結果)->
      throw 故障 if 故障
      json = JSON.parse(結果)
      console.log "#{json.open["1449792000000"]}"

以上測試成功.

    ### 不要這樣寫,會出錯!
    Pysh.run 'getStock.py', {mode: 'json'}, (故障, 結果)->
      throw 故障 if 故障
      json = 結果
      console.log "#{json.open["1449792000000"]}"
    ###

如何指定要獲取的品種代碼?這需要向 Python傳遞指令,根據上文參考文件,這樣做:

    pysh = Pysh.run 'getStockId.py', {mode: 'text'}

    pysh.send '300388'
    pysh.on 'message', (data)->
      json =JSON.parse data
      console.log json.open["1449792000000"]

    pysh.end (err)->
      #throw err if err
      console.log err if err
      console.log 'finished'
