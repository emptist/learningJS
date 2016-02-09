{exec}=require 'child_process'
# 此法,stdout,stderr皆為buffer

# default options:
options =
  encoding: 'utf8'
  timeout: 0 # 若設置為很小的值,來不及完成,就得不到答復,可以測試50和5000
  maxBuffer: 204800
  killSignal: 'SIGTERM'
  cwd: null
  env: null

exec 'coffee --help', options, (err,stdout,stderr)->
  if stdout
    console.log "received #{stdout.length} bytes"
    console.log stdout

  if stderr
    console.error stderr
