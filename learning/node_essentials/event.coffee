Person = require './person/person'

ben = new Person "Ben"
george = new Person 'George'

ben.on 'speak', (err, data)->
  console.log "#{@name}: #{data}" unless err?
ben.emit 'speak',null,'hi'

george.on 'speak', (err, data)->
  console.log "#{@name}: #{data}" unless err?

george.emit 'speak', null, 'i am george'
