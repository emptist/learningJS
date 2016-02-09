https= require 'https'

module.exports =
  printName: (person)->
    "#{person.last}, #{person.first}"

  loadWiki: (person, callback)->
    url = "https://en.wikipedia.org/wiki/#{person.first}_#{person.last}"
    https.get url, (res)->
      html = ""
      res.setEncoding 'utf8'
      res.on 'data', (chunk)->
        html += chunk
      res.on 'end', ->
        callback html
