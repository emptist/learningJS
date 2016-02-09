# module.exports和require
# 最重要記住,objects are cached
# 所以,引用多次仍是同一個法

greeting = ()-> console.log 'greeting'
g = new greeting

greeting.prototype.name = 'hello'
o = name: 'name'
console.log '成功'

module.exports = greeting
