exec = (require 'child_process').exec
###
exec "open http://github.com"
exec "open -a Terminal ."
###
exec "ls", (err, stdout)->
  if err?
    throw err
  console.log "ok"
  console.log stdout
exec "git --version", (err, stdout)->
  if err?
    throw err
  console.log "ok"
  console.log stdout
