here is the original code that doesn't work any more.

    https = require "https"

    username = 'emptist'
    getRepos = (username, callback)->
      options =
        host: 'api.github.com'
        path: "users#{username}/repos"
        method: 'GET'
        headers:
          'User-Agent': 'emptist'

      request = https.request options,(response) ->
        body = ''
        response.on "data", (chunk)->
          body += chunk.toString 'utf8'
        response.on "end", ->
          json = JSON.parse body
          repos = ({name, description} for repo in json)
          callback repos
          
      request.end()

    getRepos 'emptist', (repos)->
      console.log "Has#{repos.length} repos"
