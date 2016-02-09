smallestCommonMultiples = (array)->
  gcd = (a, b) -> # 定義兩個數的最大公約數
    return gcd b, a if a < b
    if (mod = a % b) is 0 then b else gcd b, mod

  scm = (a, b)->  # 定義兩個數求最小公倍數
    a * b / gcd(a, b)

  scms = (n, arr)->  # 定義一個求單個數字與一組數字最小公倍數的function
    return n if arr.length is 0 #如果arr是空的,就是n
    scms scm(n, arr.pop()), arr #如果不是空的,就從中取出一個數,跟n求最小公倍數, 再用循環

  x = Math.min(array...)
  y = Math.max(array...)
  arr = [x..y]
  scms arr.pop(), arr

console.log smallestCommonMultiples [12, 14]
