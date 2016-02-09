https= require 'https'

module.exports =
  printName: (person)->
    "#{person.last}, #{person.first}"
  loadWiki: (person,callback)->
    url = "https://en.wikipedia.org/#{person.first}_#{person.last}"
    https.get url, (res)->
      body = ""
      res.setEncoding 'utf8'
      res.on 'data', (chunk)->
        body += chunk

      res.on 'end', ->
        callback body
