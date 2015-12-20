使用中文模塊,github作品集
小心,debug信息中文支持不好.

    取作品集 = require './l07cn_request.coffee.md'

    取作品集.取github作品集 'emptist', (err, response) ->
      if err then console.log err
      console.log response
