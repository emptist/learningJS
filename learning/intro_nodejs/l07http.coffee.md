here is the original code that doesn't work any more.

    https = require "https"

    username = 'emptist'
    getRepos = (username, callback)->
      options =
        host: 'api.github.com'
        path: "users#{username}/repos"
        method: 'GET'
        agent: new https.Agent 'User-Agent: emptist'

      request = https.request options,(response)->
        body = ''
        response.on "data", (chunk)->
          body += chunk.toString 'utf8'
        response.on "end", ->
          repos = []
          json = JSON.parse body
          for repo in json
            repos.push
              name: repo.name
              description: repo.description

          #console.log "Repos: ", repos
          callback repos
      request.end()

    getRepos 'emptist', (repos)->
      console.log "Has#{repos.length} repos"
