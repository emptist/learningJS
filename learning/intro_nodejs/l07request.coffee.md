為了方便提供 github 所需要的 User-Agent header,經過搜索找到了
[request 庫](https://www.npmjs.com/package/request).使用request
就不再需要 https = require "https" 了


    request = require "request"

    getRepos = (username='emptist')->

      options =
        url: "https://api.github.com/users/#{username}/repos"
        headers:
          'User-Agent': 'emptist'
        json: true

      callback = (err, response, json)->
        if not err and response.statusCode is 200
          repos = ({name, description}=repo for repo in json)
          console.log "#{username} has #{repos.length} repos"
          console.log "#{repos[0].description}"

      request options, callback

    getRepos()

在 Atom editor 中安裝了 Script 就可以用 command + i 來運行這個文件,結果會顯示在下面.
