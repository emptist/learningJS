_ = require 'underscore'
算 =
  根: Math.sqrt
  方: (x) -> x * x
  立方: (x) -> x * @方 x

console.log 算.立方(25)
