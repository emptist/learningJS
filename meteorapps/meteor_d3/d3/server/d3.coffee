Meteor.startup ->
	share.Data.remove({}) 
	unless share.Data?.findOne()?
		share.Data.insert idx: 1, data:[12, 24, 32, 45] 
 