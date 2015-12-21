# chp 02 CoffeeScript Basics
CoffeeScript Application Development Cookbook 2015
摘要(我以前不熟悉的部份).
## object.toString()
可以給一個object定義toString()以便以文字形式呈現自己.而非[object object].

    class 證券
      constructor: ({@代碼, @名稱, @收}) ->
      toString: -> "#{@代碼}#{@名稱}: #{@收}"

    創業板B = new 證券 代碼:150153, 名稱:'創業板B', 收:2.888
    # {150153, '創業板B', 2.888}

    console.log "收盤信息: #{創業板B}"

## 匹配規則公式
英文 regular expressions (一般謬譯成正則表達式).

我們寫一個自動換行方案.使用匹配規則公式.

定義:

    自動換行 = (文本, 限長 = 80, 換行符 = '\n') ->

匹配規則:
這是一種悠久的技術,早期的編輯器ed/vi都支持這種公式,天天用所以不難.但現在很少用,就比較難記.用到
查一下就好了.以下照抄 p24:

      規則 = RegExp \
        ".{1,#{maxLineWidth}}(\\s|$)|\\S+?(\\s|$)", 'g'

".{1, n}",.是一行的第一個字,切取一片段,從第1到第n個字, \s 是空格, $ 是行尾

> 太困了, 睡了.
