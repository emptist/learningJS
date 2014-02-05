if Meteor.isClient
  Template.hello.helper
	greeting: -> "Welcome to httpGet."
	info: Session.get "info"

  Template.hello.events
    'click input#button': () ->
      # template data, if any, is available in 'this'
      	unless console? 
			info = Meteor.call "openSession", url, (err,res)->
					unless err
       		 			Session.set "info",res

if (Meteor.isServer) 
  	Meteor.startup ->
	Meteor.methods
		openSession:(url) ->
			fut = -> new Future()
			getInfo: (url)->
				Meteor.http.get url, (err, res)->
					fut.ret res
				fut.wait() 
 	 	
