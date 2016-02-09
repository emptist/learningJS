{render, renderable, ul, li, input} = require 'teacup'
output = render ->
  ul ->
    li 'Bergamont'
    li 'Chamomile'

console.log output
# Outputs <ul><li>Bergamont</li><li>Chamomile</li></ul>


template = renderable (teas)->
  ul ->
    for tea in teas
      li tea
    input type: 'button', value: 'Steep'

console.log template(['Jasmine', 'Darjeeling'])
