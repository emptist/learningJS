# from video lynda Node.js Essential Training, update 12, 2015 tutorial
# 04_04 global timing functions

waitTime = 1000
current = 0
period = 10

report = ->
  current += period
  process.stdout.clearLine()
  process.stdout.cursorTo 0
  process.stdout.write "已經等了 #{current/waitTime*100}%"

repeat = setInterval report, period

callback = ->
  clearInterval repeat
  console.log '\n完'

# 等過了等待期之後才做callback
setTimeout callback, waitTime
