#see:
# https://www.npmjs.com/package/request
# https = require "https"
request = require "request"
username = 'emptist'

getRepos = (username='emptist')->
  options =
    url: "https://api.github.com/users/#{username}/repos"
    headers:
      'User-Agent': 'emptist'
    json: true

  callback = (err, response, body)->
    if not err and response.statusCode is 200
      repos = []
      json = body #JSON.parse body
      for repo in json
        repos.push
          name: repo.name
          description: repo.description
      console.log "#{username} has #{repos.length} repos"  # ,repos

  request options, callback

getRepos()
