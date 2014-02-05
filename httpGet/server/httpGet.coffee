#  	Meteor.startup ->{}
	
Meteor.methods
	openSession:(url) ->
		fut = -> new Future()
		getInfo: (url)->
			Meteor.http.get url, (err, res)->
				fut.ret res
			fut.wait() 
	 	
