lcd = (a, b) ->
  return lcd b, a if a < b
  if (mod = a % b) is 0 then b else lcd b, mod

console.log lcd(252,204)
