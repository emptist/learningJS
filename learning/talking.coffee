sayings = [
  'hello, 1'
  'last 2'
  'this is 3'
  'and 4'
  'that 5'
]
# repeat forever
repeat = ->
  i = Math.floor Math.random()*sayings.length
  process.stdout.write "#{sayings[i]}\n"

# 在coffee中,如果callback在前,一定要把callbalk分開寫,免錯
interval = setInterval repeat, 500

# til stdin recieved sth then exit
process.stdin.on 'data', (data)->
  console.log "stdin recieved ata: #{data.toString().trim()}"
  clearInterval interval
  process.exit()
