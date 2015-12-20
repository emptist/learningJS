### 嘗試用中文

為了方便提供 github 所需要的 User-Agent header,經過搜索找到了
[request 庫](https://www.npmjs.com/package/request).使用request
就不再需要 https = require "https" 了


    request = require "request"



    取作品集 = (用戶名='emptist', 回應)->

      參數 =
        url: "https://api.github.com/users/#{用戶名}/作品集"
        headers:
          'User-Agent': 用戶名
        json: true

      # 回應: callback
      callback = (出錯, 服務器複件, json)->
        if not 出錯 and 服務器複件.statusCode is 200
          作品集 = ({name, description}=repo for repo in json)

      回應 request 參數, callback

    取作品集 用戶名, ->
      console.log "#{用戶名} 共有 #{作品集.length} 個作品集"
      console.log "#{作品集[0].description}"


在 Atom editor 中安裝了 Script 就可以用 command + i 來運行這個文件,結果會顯示在下面.

今天 github 可能修改了什麼,之前可行,今天沒有結果.
將之做成模塊:

    module.exports.取github作品集 = 取作品集

如此可以供程序使用.也可發佈到npmjs.org.
