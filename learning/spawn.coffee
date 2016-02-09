#通過 stdin stdout與子程連通
spawn = (require 'child_process').spawn

# coffee talking.coffee
cp = spawn 'coffee', ['talking.coffee']

cp.stdout.on 'data', (data)->
  console.log "stdout: #{data.toString()}"

cp.on "close", ->
  console.log "child process has ended"
  process.exit()

# 在coffee中,如果callback在前,一定要把callbalk分開寫,免錯
stop = -> cp.stdin.write 'stop'
setTimeout stop, 2000
