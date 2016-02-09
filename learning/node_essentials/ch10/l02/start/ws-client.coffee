ws = new WebSocket('ws://localhost:3333')

ws.onopen = ->
  setTitle 'Connected'

ws.onclose = ->
  setTitle 'disconnected'

ws.onmessage = (payload)->
  printMessage payload.data

document.forms[0].onsubmit = ->
  input = document.getElementById 'message'
  ws.send input.value
  input.value = ''

setTitle = (title)->
  document.querySelector('hi').innerHTML = title

printMessage = (message)->
  p = document.createElement 'p'
  p.innerText = message
  document.querySelector('div.messages').appendChild p
