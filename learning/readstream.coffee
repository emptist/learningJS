fs = require 'fs'
stream = fs.createReadStream '../loginoptions.coffee.md'
data = ''

stream.once 'data', ->console.log "\n Started..."

stream.on 'data', (chunk)->
  data += chunk
  process.stdout.write "chunk #{chunk.length}\n"

stream.on 'end', ->
  console.log "\n Finished reading #{data.length}"
