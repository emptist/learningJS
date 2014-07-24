###
Meteor.publish "depsChannel" , ->
	share.Departments.find()
###

share.adminLoggedIn = true

class PComponent 
	constructor:(@indx)->
	ctname: 'ctname'

		
class THead 
 	constructor: (@indx)->
 	thname:"name"

Meteor.startup -> 
	unless share.theads.findOne()? # to initialize only once
		insertInto share.theads, new THead 1 

getComponents = ->
	PComponents.find().fetch() 

addComponent = ->
	insertInto share.theads, new PComponent getComponents().length + 1


getHeads = ->
	share.theads.find().fetch() 

addHead = ->
	insertInto share.theads, new THead getHeads().length + 1

delHead = (id)->
	removeFrom share.theads, id

upsHead = (obj)->
	upsertWithId share.theads, obj

addTable = -> #later I'll change following codes to use table object to remember it's elemements

Meteor.methods
	newTable: addTable
	newComponent: addComponent
	newHead: addHead
	delHead: delHead
	upsHead: upsHead

share.consolelog = (collection , obj)->
	#console.log "object now is ", collection.findOne( indx: obj.indx ) 

removeFrom = (collection, id)->
	if share.adminLoggedIn
		collection.remove _id: id


upsertTo = (collection, obj)-> 
	# each obj should have an indx; return Mongodb object _id
	if share.adminLoggedIn
		obj.createdOn = new Date
		collection.update indx: obj.indx ,
			obj, 
			upsert: true

upsertWithId = (collection, obj)-> 
	if share.adminLoggedIn
		obj.createdOn = new Date
		collection.update _id: obj._id ,
			obj, 
			upsert: true

upsertToId = (collection, id, obj)-> 
	if share.adminLoggedIn
		obj.createdOn = new Date
		collection.update _id:id ,
			obj, 
			upsert: true

insertInto = (collection, obj)->
		if share.adminLoggedIn
			obj.createdOn = new Date
			collection.insert obj

	

###		
	unless share.Departments.findOne()? # to initialize only once
		class Department 
			constructor: (@deptname) ->
			GuDingZIchan: 100000
			ZaigangrENShu: 10
			HuanSuanrENShu: 10
			jixiaoFenshu: 99
			CHAYiXiShu: 1
			jIEyU: 50000
			# object methods could not be stored into mongodb so the following doesn't work
			YunXiaohANbaodi: (baodiYunXiao) =>
				YX = @jIEyU / @GuDingZIchan
				bao = Math.max 0, 0.5 * (YX + baodiYunXiao) 
				Math.max YX, bao
		
	 	for deptname in [1..3]
		 	insertInto share.Departments, new Department deptname 
			
	#console.log share.Departments.find().fetch()
	#console.log share.Settings.findOne()
	recalculate()

			
 
dept = (obj)->
	upsertWithId share.Departments, obj

sett = (obj)->
	upsertWithId share.Settings, obj

getDepts = ->
	share.Departments.find().fetch() 

addDept = ->
	class Department 
		constructor: (@deptname) ->
		GuDingZIchan: 100000
		ZaigangrENShu: 10
		HuanSuanrENShu: 10
		jixiaoFenshu: 99
		CHAYiXiShu: 1
		jIEyU: 50000

	insertInto share.Departments, new Department getDepts().length + 1
	recalculate() 

removeDept = (id)->
	removeFrom share.Departments, id

recalculate = -> if share.adminLoggedIn
	settings = share.Settings.findOne()
	baodibiLi = settings.baodibiLi 
	FENPeibiLi = settings.FENPeibiLi
	pown = settings.pown

	#re-initializing
	settings.ZONGhEFENzhI = 0
	settings.KEShiFENPeibiLi = 0
	settings.KEShijiangJIN = 0
	settings.rENJUNjiangJIN = 0
	settings.LishiFENPeibiLi = 0

	jy = 0
	zc = 0
	ZaigangrENShu = 0
	zongLishijiangJIN = 0
	for KEShi in getDepts()
		jy += KEShi.jIEyU
		zc += KEShi.GuDingZIchan
		ZaigangrENShu += KEShi.ZaigangrENShu
		zongLishijiangJIN += KEShi.LishijiangJIN
	
	zongGuDingZIchan = Math.max 0, zc
	zongjIEyU = Math.max 0, jy
	zongJiXiaoGONGZIchI = zongjIEyU
	rENJUNjiangJIN = zongJiXiaoGONGZIchI / ZaigangrENShu
	settings.LishiFENPeibiLi = zongLishijiangJIN / zongJiXiaoGONGZIchI
	sett settings

	# 保底運營效率 保底比例 * 總的資產運營效率
	baodiYunXiao = baodibiLi * zongjIEyU / zongGuDingZIchan 
	# 计算科室计奖分值

	for KEShi in getDepts()
		YX = KEShi.jIEyU / KEShi.GuDingZIchan
		bao = Math.max 0, 0.5 * (YX + baodiYunXiao) 
		KEShi.YunXiaohANbaodi =  Math.max YX, bao
		#if KEShi.LishiXiShu? then KEShi.CHAYiXiShu = KEShi.LishiXiShu
		KEShi.ZONGhEFENzhI = KEShi.jixiaoFenshu * KEShi.HuanSuanrENShu * (Math.pow KEShi.YunXiaohANbaodi, 1/pown) * KEShi.CHAYiXiShu
		dept KEShi
		settings.ZONGhEFENzhI += KEShi.ZONGhEFENzhI
	sett settings
	
	#i 计算科室计奖分值小计
		
	#j 计算科室领奖比例, 用科室计奖分值/科室计奖分值小计
	
	#k 计算科室绩效分配, 用 科室领奖比例*总绩效分配池
	settings.ZuixiaoCHAYiXiShu = 100
	settings.ZuixiaotIAOzhengbiLi = 100
	for KEShi in getDepts()
		KEShi.KEShiFENPeibiLi = KEShi.ZONGhEFENzhI / settings.ZONGhEFENzhI
		KEShi.LishiFENPeibiLi = KEShi.LishijiangJIN / (zongJiXiaoGONGZIchI * FENPeibiLi)
		KEShi.tIAOzhengbiLi = KEShi.LishiFENPeibiLi / KEShi.KEShiFENPeibiLi
		KEShi.KEShijiangJIN = KEShi.KEShiFENPeibiLi * zongJiXiaoGONGZIchI * FENPeibiLi
		KEShi.rENJUNjiangJIN = KEShi.KEShijiangJIN / KEShi.ZaigangrENShu
		dept KEShi

		settings.KEShiFENPeibiLi += KEShi.KEShiFENPeibiLi
		settings.KEShijiangJIN += KEShi.KEShijiangJIN
		settings.ZuixiaoCHAYiXiShu = Math.min KEShi.CHAYiXiShu, settings.ZuixiaoCHAYiXiShu
		settings.ZuixiaotIAOzhengbiLi = Math.min KEShi.tIAOzhengbiLi, settings.ZuixiaotIAOzhengbiLi

	settings.rENJUNjiangJIN = settings.KEShijiangJIN / ZaigangrENShu
	sett settings

	ZuixiaoLishiXiShu = 100
	for KEShi in getDepts()
		KEShi.LishiXiShu = (KEShi.CHAYiXiShu / settings.ZuixiaoCHAYiXiShu) * KEShi.tIAOzhengbiLi / Math.min 0.99, settings.ZuixiaotIAOzhengbiLi
		ZuixiaoLishiXiShu = Math.min KEShi.LishiXiShu, ZuixiaoLishiXiShu
		dept KEShi
	
	for KEShi in getDepts()
		KEShi.LishiXiShu = KEShi.LishiXiShu / ZuixiaoLishiXiShu
		dept KEShi
###
