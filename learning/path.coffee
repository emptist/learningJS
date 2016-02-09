# from video lynda Node.js Essential Training, update 12, 2015 tutorial
# 05_01 core modules

path = require 'path'
util = require 'util'
v8 = require 'v8'

util.log "當前文件名#{path.basename(__filename)}"
util.log path.join __dirname, 'www', 'nodejs', 'org'
util.log v8.getHeapStatistics() # 內存使用情況
