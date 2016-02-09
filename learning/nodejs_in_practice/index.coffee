CountStream = require './countstream'
countStream = new CountStream('jisilu')
http = require 'http'
http.get 'http://www.jisilu.cn', (res)->
  res.pipe countStream
countStream.on 'total', (count)->
  console.log "Total matches: #{count}"
