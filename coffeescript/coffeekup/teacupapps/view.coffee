express = require 'express'
teacup = require 'teacup/lib/express'

app = express()
app.configure ->
  app.engine "coffee", teacup.renderFile
