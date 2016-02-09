EventEmitter = (require 'events').EventEmitter
util = require 'util'

Person = (@name)->

util.inherits Person, EventEmitter

module.exports = Person
