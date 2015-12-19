## 讀寫文件
使用 fs 庫處理文件:

    fs = require 'fs'

有順序執行和非順序執行兩種方式,順序執行是一步一步照著程序寫作順序執行,非順序執行是cpu順序,不等
讀寫以及網絡等等操作,cpu空下來就做下一步,這邊文件讀取回來,已經完成很多其他工作了.

### 非順序方式

    console.log '非順序執行程序方式, 用回應方案(callback function)來處理讀入的文件'
    fs.readFile 'l03file.litcoffee', (err, data)->
      if err
        console.log '出錯了'
      else
        console.log """文件內容:

          #{data}
          """
    console.log '不等文件讀完,cpu充分利用時間...所以我先出現,以下才是文件內容:'

### 順序方式

有時需要先讀取文件內容,下面的事情才好做,比如讀入配置文件:

    console.log '順序執行程序方式, 直接回報讀入的文件內容:'
    data = fs.readFileSync 'l03file.litcoffee'
    console.log """
      #{data}
    """

### parse 解析文件內容

例如 config.json

    console.log '順序執行程序方式, 直接回報讀入的文件內容:'
    data = fs.readFileSync 'config.json'
    console.log """
      #{data}
      #{(JSON.parse data).host}
    """
### 用順序執行方式寫文件

    console.log '順序執行程序方式'
    data = fs.writeFileSync 'hello.txt', "helllo world"

### 用非順序執行方式寫文件

    console.log '順序執行程序方式, 例如記錄log而不影響止盈止損計算速度'
    data = fs.writeFile '止盈.log', "helllo world", (err)->
      console.log '不影響以下程序運行'
    console.log '我先運行'
