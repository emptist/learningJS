#Meteor.subscribe "depsChannel"

Session.setDefault "editing", true

trows = -> 
	share.trows.find({}, {sort: {indx: 1}})
theads = ->
	share.theads.find({}, {sort: {indx: 1}})



Template.main.helpers
	tables: ->
		[1..3 ]



Template.editHeadView.helpers
	theads: ->
		theads()

Template.basicTable.helpers
	editing: ->
		Session.get "editing"

Template.editHeadView.events
	'click #addHead': (e,t) ->
		Meteor.call "newHead"	
	'click #delHead': (e,t) ->
		Meteor.call "delHead", @_id

	'click #saveHead': (e,t) ->
		Session.set "editing", false

	'keyup input': (e,t) ->
		v =  e.target.value.trim() 
		this.thname = v 
		Meteor.call "upsHead", this # well are there any simpler approaches?


Template.headView.helpers
	theads: ->
		theads()

Template.headView.events
	
	'click #editHead': (e,t) ->
		Session.set "editing", true		

###	
Template.rows.events
	'click #addDept': (e,t) ->
		Meteor.call "newDept"	

Template.department.events 
	'click #removeDept': (e,t) ->
		Meteor.call "removeDept", this._id

	'keyup input': (e,t) ->
		v = 1 * e.target.value.trim() 
		this["#{e.target.id}"] = switch e.target.id
			when "ZaigangrENShu" then v
			when "HuanSuanrENShu" then v
			when "jixiaoFenshu" then Math.max 0, v #could be 0
			when "jIEyU" then v
			when "GuDingZIchan" then Math.max 1, v
			when "CHAYiXiShu" then Math.max 0.01, v
			when "LishiXiShu" then Math.max 0, v
			when "LishijiangJIN" then Math.max 0, v
			else e.target.value.trim() # could be department name now
      

		Meteor.setTimeout ( => # must use => instead of -> here to keep this level this
			Meteor.call "dept", this
			Meteor.call "recalculate"), 1500 # wait until input finished
			
###		

