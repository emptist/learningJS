fs = require 'fs'
md = '''
Sample
=====
subtitle
-----
* point
* point
'''
fs.writeFile 'sample.md', md.trim(), (err)->
  console.log 'file saved'
