# from node.js in practice
Writable = (require 'stream').Writable

class CountStream extends Writable
  constructor: (matchText, options) ->
    Writable.call this, options
    @count = 0
    @matcher = new RegExp matchText, 'gi'
### this doesn't work!
  _write: (chunk, encoding, callback) ->
    m = chunk.toString().match @matcher
    if m then @count += m.lenghth
    callback()
  end: -> @emit 'total', @count

###
CountStream::_write = (chunk, encoding, cb)->
  matches = chunk.toString().match @matcher
  if matches then @count += matches.length
  cb()

CountStream::end = ->
  this.emit 'total', this.count

module.exports = CountStream
