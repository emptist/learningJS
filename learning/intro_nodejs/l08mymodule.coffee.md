## 製作自己的module

### 先寫一個簡單的module,只有以下function:
> 你好 = -> "嗎?"

取名myModule.js

    我的 = require './myModule.js'
    console.log 我的.你好()

並不工作? 原來需要把共享的東西放到 module.exports 這個裡面, 輸出才行,我們回去加上:

> module.exports.你好 = 你好

這樣就好了.

### 嘗試用coffeescript可以不?

    我的 = require './coffeeModule.coffee'
    console.log 我的.coffee你好()

結論是可以的!

### 嘗試使用literal coffee可以不?

    我的 = require './coffeeModule.coffee.md'
    console.log 我的.md你好()

結論是,可以的!
