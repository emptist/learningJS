expect = (require 'chai').expect
tools = require '../lib/tools'
nock = require 'nock'


describe 'Tools', ->
  describe 'printName()', ->
    it 'should print the last name first', ->
      results = tools.printName first:'alex', last:'banks'
      expect(results).to.equal 'banks, alex'

  describe 'loadWiki()', ->
    before ->
      nock('https://en.wikipedia.org')
        .get('/wiki/Abraham_Lincoln')
        .reply(200, 'Mock')

    @timeout 5000
    # note: *done*
    it "Load Abra's wiki page", (done)->
      tools.loadWiki {first:'Abraham', last:'Lincoln'}, (html)->
        expect(html).to.equal 'Mock'
        done()
