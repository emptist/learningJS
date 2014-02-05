Template.hello.greeting = -> 
	"Welcome to httpGet."
Template.hello.info = ->
	 Session.get "info"

# template data, if any, is available in 'this'
Template.hello.events
	'click #button': (e,t) ->
		if console?
	  		url = t.find("input#url").value
	  		console.log url
			Meteor.call "openSession", url, (err,res)->
				unless err
		 			Session.set "info",res.content
			console.log "clicked", url
	  		#@url = t.find("input#url").value
	