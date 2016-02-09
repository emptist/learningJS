express = require 'express'
cors = require 'cors'
# parse the posted data
bodyParser = require 'body-parser'

skierTerms = [
  {term:'kh', defined: 'ehkii'}
  {term:'khoo', defined: 'kkei'}
]

app = express()

# add middleware
app.use bodyParser.json()
app.use bodyParser.urlencoded extended:false

app.use (req,res,next)->
  console.log "#{req.method} request for #{req.url} #{JSON.stringify req.body}"
  next()

app.use express.static './public'
app.use cors()
# routes
app.get '/dictionary-api', (req,res)->
  res.json skierTerms
# routes
app.post '/dictionary-api',(req,res)->
  skierTerms.push req.body
  res.json skierTerms
# delet router
app.delete '/dictionary-api/:item',(req,res)->
  skierTerms = skierTerms.filter (definition)->
    definition.term.toLowerCase() isnt req.params.term.toLowerCase()
  res.json skierTerms

app.listen 3000
console.log 'express running'

module.exports = app
