expect = (require 'chai').expect
tools = require '../lib/tools'

describe 'Tools', ->
  describe 'printName()', ->
    it 'should print the last name first', ->
      results = tools.printName first:'alex', last:'banks'
      expect(results).to.equal 'banks, alex'

  describe 'loadWiki()', ->
    @timeout 5000
    # note done
    it "Load Abra's wiki page",(done)->
      tools.loadWiki {first:'Abraham', last:'Lincoln'}, (html)->
        expect( html).to.be.ok
        done()
