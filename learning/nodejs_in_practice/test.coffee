assert = require 'assert'
CountStream = require './countstream'
countStream = new CountStream 'example'
fs = require 'fs'
passed = 0

countStream.on 'total', (count)->
  assert.equal count, 1
  passed++

# __filename is this current file
(fs.createReadStream __filename).pipe countStream

process.on 'exit', ->
  console.log 'Asscertions passed', passed
