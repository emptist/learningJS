Template.hello.greeting = -> 
	"Welcome to httpGet."
Template.hello.info = ->
	 Session.get "info"

# template data, if any, is available in 'this'
Template.hello.events
	'click #button': (e,t) ->
  		rl = ->
  			t.find("input#url").value
		Meteor.call "openSession", rl()?, (err,res)->
			unless err
	 			Session.set "info",res.content
		console.log "clicked", rl()
  		#@url = t.find("input#url").value
	