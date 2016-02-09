express = require 'express'
cors = require 'cors'

skierTerms = [
  {term:'kh', defined: 'ehkii'}
  {term:'khoo', defined: 'kkei'}
]

app = express()
# add middleware
app.use (req,res,next)->
  console.log "#{req.method} request for #{req.url}"
  next()

app.use express.static './public'
app.use cors()
app.get '/dictionary-api', (req,res)->
  res.json skierTerms

app.listen 3000
console.log 'express running'

module.exports = app
