Template.hello.greeting = -> 
  "Welcome to learningd3."


Template.hello.events
  'click input' : ->
    # template data, if any, is available in 'this'
    if typeof console isnt 'undefined'
      console.log "You pressed the button"
      

