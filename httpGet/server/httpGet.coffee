#  	Meteor.startup ->{}
	
Meteor.methods
	openSession:(url='http://hq.sinajs.cn/list=sh600663') ->
		console.log 'server', url#, r
		#fut = -> new Future()
		getInfo = (url)->
			Meteor.http.get url, (err, res)->
				#r = fut.ret res
				r = res
				console.log 'server', url, r
				r
		#	fut.wait() 
	 	
