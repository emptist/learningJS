Meteor.publish "tasks", ->
	TaskDB.find {}, sort:( created: -1 )
