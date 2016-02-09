# from video lynda Node.js Essential Training, update 12, 2015 tutorial
# 05_02 collecting information with readline

# not finished yet

readline = require 'readline'
fs = require 'fs'
# create instance contral asking and collecting information
rl = readline.createInterface process.stdin, process.stdout

realPerson =
  name: ''
  sayings: []

# using question to ask question
rl.question 'what is the name of the person?', (answer)->
  realPerson.name = answer.trim()
  stream = fs.createWriteStream "#{realPerson.name}.md"
  stream.write "#{realPerson.name}\n======\n\n"
  
  # set a prompt
  rl.setPrompt "what would #{realPerson.name} say?(exit to leave)"
  #display the prompt
  rl.prompt()
  rl.on 'line', (saying)->
    if saying.toLowerCase().trim() is 'exit'
      rl.close()
      stream.close()
    else
      realPerson.sayings.push saying.trim()
      stream.write "* #{saying.trim()}\n" 
      rl.setPrompt "what else would #{realPerson.name} say?(exit to exit)"
      rl.prompt()

rl.on 'close', ->
  # %j is for json while %s if for string
  console.log "%s is person saying %j",realPerson.name, realPerson.sayings
  process.exit()
