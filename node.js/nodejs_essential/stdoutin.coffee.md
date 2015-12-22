## stdin stdout

    question = ["你好嗎?","你是誰?","你做什麼?"]
    answers = []
    ask = (i)->
      process.stdout.write "\n\n#{question[i]}"
      process.stdout.write ">"

    process.stdin.on 'data',(data)->
      # process.stdout.write "\n #{data.toString().trim()} \n"
      answers.push data.toString().trim()
      if answers.length < question.length
        ask answers.length
      else
        process.exit()
    process.on 'exit', ->
      process.stdout.write "\n\n"
      process.stdout.write "\n #{answers} \n"
      process.stdout.write "\n"
    ask 0
