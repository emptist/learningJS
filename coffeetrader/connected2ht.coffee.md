## 試著連接華泰取得數據:
1. 打開chrome瀏覽器,登錄網上營業廳,在線委託交易
1. 打開chrome開發者工具,查閱network
1. 進入委託界面,點選一股,查看network

我要先學一下chrome的用法.
以下嘗試一下取數據:

    request = require 'request'
    options =
      ip: '112.25.190.230:80'
      url: 'http://hq.htsc.com.cn/cssweb?'
      json: true
      query:
        type: 'GET_PRICE_VOLUMEJSON'
        exchange: 'sz'
        stockcode: '150153'
        stocktype: '0'
        random: String(Math.random())

    url = "http://112.25.190.230:80/cssweb?type=GET_PRICE_VOLUMEJSON&exchange=sz&stockcode=150153&stocktype=0&random=#{Math.random().toString()}"

    request {url:url, json: true},(err,response,json)->
      #console.log url
      #console.log response
      if err
        console.log err
      else
        console.log json


成功.
```
{ cssweb_code: 'success',
  type: 'GET_PRICE_VOLUMEJSON',
  stockcode: 'sz150153',
  data:
   [ { sjw5: 1.667, #sell 價位5
       ssl5: 493,   #sell 數量5
       sjw4: 1.666,
       ssl4: 1239,
       sjw3: 1.665,
       ssl3: 255,
       sjw2: 1.664,
       ssl2: 2891,
       sjw1: 1.663,
       ssl1: 12494,
       bjw1: 1.662, #buy 價位1
       bsl1: 16238, #buy 數量1
       bjw2: 1.661,
       bsl2: 9098,
       bjw3: 1.66,
       bsl3: 4965,
       bjw4: 1.659,
       bsl4: 807,
       bjw5: 1.658,
       bsl5: 566,
       wb: 0.2916,
       wc: 14302,
       zjcj: 1.662,
       cjje: 424800920.873,
       zd: 0.018,
       jrkp: 1.629,
       zf: 0.0109,
       zgcj: 1.678,
       cjsl: 2601368.5,
       zdcj: 1.593,
       xs: 35506,
       lb: 0.934,
       zt: 1.808,
       dt: 1.48,
       zrsp: 1.644,
       sy: 0,
       gb: 0,
       hs: 0,
       ltsl: 0,
       jz: 0,
       mgsy: 0,
       syjd: 0,
       zqjc: '创业板B ',
       tp: 0,
       fullprice: 0,
       np: 1156317.5,
       wp: 1445057.5 } ] }
```

華泰address:

```
112.25.190.230:80
61.132.51.124:80
```

有以下幾種查詢:

```
GET /cssweb?type=GET_TICK_DETAILNORMAL&exchange=sz&stockcode=000011&from=11&to=0&radom=0.9800330149009824 HTTP/1.1
Host: hq.htsc.com.cn
Connection: keep-alive
X-Requested-With: ShockwaveFlash/19.0.0.226
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36
Accept: */*
DNT: 1
Referer: http://hq.htsc.com.cn/
Accept-Encoding: gzip, deflate, sdch
Accept-Language: en-US,en;q=0.8,zh-TW;q=0.6,zh;q=0.4,zh-CN;q=0.2,en-GB;q=0.2
```
```
curl 'http://hq.htsc.com.cn/cssweb?type=GET_TICK&exchange=sz&stockcode=159915&from=0&radom=0.003914072178304195' -H 'DNT: 1' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,zh-TW;q=0.6,zh;q=0.4,zh-CN;q=0.2,en-GB;q=0.2' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36' -H 'Accept: */*' -H 'Referer: http://hq.htsc.com.cn/' -H 'X-Requested-With: ShockwaveFlash/19.0.0.226' -H 'Connection: keep-alive' --compressed
```

取歷史行情:
```
GET /kline/sz/day/159915/159915_3?ram=0.1772548919543624 HTTP/1.1
Host: hq.htsc.com.cn
Connection: keep-alive
X-Requested-With: ShockwaveFlash/19.0.0.226
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36
Accept: */*
DNT: 1
Referer: http://hq.htsc.com.cn/
Accept-Encoding: gzip, deflate, sdch
Accept-Language: en-US,en;q=0.8,zh-TW;q=0.6,zh;q=0.4,zh-CN;q=0.2,en-GB;q=0.2

GET /cssweb?type=REFRESH_KLINE&exchange=sz&stockcode=159915&quotetime=20151130&period=month&radom=0.40205614548176527 HTTP/1.1
Host: hq.htsc.com.cn
Connection: keep-alive
X-Requested-With: ShockwaveFlash/19.0.0.226
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36
Accept: */*
DNT: 1
Referer: http://hq.htsc.com.cn/
Accept-Encoding: gzip, deflate, sdch
Accept-Language: en-US,en;q=0.8,zh-TW;q=0.6,zh;q=0.4,zh-CN;q=0.2,en-GB;q=0.2

211.162.62.1
211.162.52.205
```
