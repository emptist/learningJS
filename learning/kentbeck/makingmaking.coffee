#this is from youtube by kent beck https://www.youtube.com/watch?v=nIonZ6-4nuU
# building testing framework

class CSUnit
  @run: (test)-> 
    result = runCount:0
    result.runCount++
    test()
    result 

assert = (flag)->throw new Error if not flag
assert true

thrown = false
try
  assert false
catch
  thrown = true # new Error
throw new Error if not thrown

result = CSUnit.run -> 
assert result.runCount is 1

console.log 'sucess!!', thrown
