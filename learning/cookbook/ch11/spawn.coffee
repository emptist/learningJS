{spawn} = require 'child_process'
# spawn returns streams instead of buffers

# 相當於liux/mac pipe:
#  $> echo 'console.log "the answer to life is #{6*7}"' | coffee -s
code = 'console.log "the answer to life is #{6*7}"'
echo = spawn 'echo', [code]
coffee = spawn 'coffee', ['-s']

echo.stdout.on 'data', coffee.stdin.write

coffee.stdout.on 'data', (data)->
  console.log data.toString()


# dosn't work
