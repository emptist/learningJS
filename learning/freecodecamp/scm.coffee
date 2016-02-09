scm = (a,b)->  # 定義兩個數求最小公倍數
  lcd = (a, b) ->
    return lcd b, a if a < b
    if (mod = a % b) is 0 then b else lcd b, mod

  a * b / lcd(a, b)

console.log scm 22,33
