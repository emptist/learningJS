學習 Smooth CoffeeScript 網站資料所作的筆記.
嘗試中文編程:

    #_ = require 'underscore'

    算 =
      根: Math.sqrt
      方: (x) -> x * x
      立方: (x) -> x * @方 x

    console.log "算25的立方#{算.立方(25)}"

在 Atom 中裝 Script 之後, cmd + i 運行.
