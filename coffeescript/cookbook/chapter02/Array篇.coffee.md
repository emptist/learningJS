# chp 02 CoffeeScript Basics
--from CoffeeScript Application Development Cookbook 2015

> 本文代碼可在Atom中執行,方法是裝 Script 這個包,然後按 cmd+i ; Windows下可能是 Ctrl+i

## iterating

這個比較容易記得,就不怎麼弄了.

須注意,如果用變量來存的話,

    fund = i for i in [150153,150152,159915,159901]

fund 是 159901,即最後一個表達式的結果. 如果想要的是一個Array,則須加上括號

    funds = (i for i in [150153,150152,159915,159901])

## sorting
規則:
默認升序排列,小的在前

  > a-b:
  >  <0: a前b後
  >  ==0: 相等
  >  >0: b前a後,大者在後

    數值= [32,325,15,286,398,96,235]
    console.log "升序排序為前小後大: #{數值.sort (前,後)-> 前 - 後}"
    console.log "降序排序為後小前大: #{數值.sort (前,後)-> 後 - 前}"

可以收盤價從低到高升序排序:
> (前, 後)-> 前.收 - 後.收

## 洗牌

這個用不著,不弄了.就是用隨機數打亂順序而已.

## mapping and reducing

沒想好怎麼翻譯.先看看reducing幹什麼

    總和 = 數值.reduce (求和中間值, 值) -> 求和中間值 + 值
    console.log "和 = #{總和}"

逐個取出,運算結果存入中間值,繼續循環直至結束.
哦明白了.這在 Smalltalk 中是 inject:into:
```
^ 數值 inject: 0 into:[:inj :v| inj + v]
```

## 篩選和檢測

篩選元素用when:

    console.log "#{i for i in [1..10] when i%2 is 0}"

檢測元素是否滿足條件, 以下的合格,是一個檢驗function:

    有些 = (合集, 合格)->
      子集 = (元素 for 元素 in 合集 when 合格 元素)
      子集.length > 0

    全部 = (合集, 合格)->
      子集 = (元素 for 元素 in 合集 when 合格 元素)
      子集.length is 合集.length

例如:

    console.log "有些品種是B股:
      #{有些 ['200002', '600000', '000001'], (代碼)-> 代碼[0] is '2'}"

---
每一個文件可以做成模塊,供其他模塊使用,輸出方法就是定義module.exports這個object如下:

    #module.exports =

使用時只需要

> 模塊 = require '文件路徑名',

亦可更制定其中的某些部份
> 模塊 = (require '文件名').模塊名

測試成功!
