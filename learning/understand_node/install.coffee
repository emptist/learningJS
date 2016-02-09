express = require 'express'
teacup = require 'teacup/lib/express'
connectAssets = require 'teacup/lib/connect-assets'

app = express()
#app.configure ->
#app.engine "coffee", teacup.renderFile
app.use connectAssets src:'assets',jsDir:'javascripts',cssDir:'stylesheets'

###
use environment variable to enable it on product
###
port = process.env.PORT ? 3000

# middleware
app.use '/assets', express.static "#{__dirname}/public"

app.get '/', (req, res)->
  res.send '<html><title>hello</title><body><h1>world!</h1></body></html>'

app.get '/api', (req, res)->
  res.json
    firstname: 'j'
    lastname:'k'

app.get '/account/:id/:market', (req, res)->
  res.json
    id:"#{req.params.id}"
    market:"#{req.params.market}"


app.listen port
