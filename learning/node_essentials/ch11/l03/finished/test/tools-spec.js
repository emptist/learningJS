// Generated by CoffeeScript 1.10.0
(function() {
  var expect, nock, tools;

  expect = (require('chai')).expect;

  tools = require('../lib/tools');

  nock = require('nock');

  describe('Tools', function() {
    describe('printName()', function() {
      return it('should print the last name first', function() {
        var results;
        results = tools.printName({
          first: 'alex',
          last: 'banks'
        });
        return expect(results).to.equal('banks, alex');
      });
    });
    return describe('loadWiki()', function() {
      before(function() {
        return nock('https://en.wikipedia.org').get('/wiki/Abraham_Lincoln').reply(200, 'Mock');
      });
      this.timeout(5000);
      return it("Load Abra's wiki page", function(done) {
        return tools.loadWiki({
          first: 'Abraham',
          last: 'Lincoln'
        }, function(html) {
          expect(html).to.equal('Mock');
          return done();
        });
      });
    });
  });

}).call(this);
