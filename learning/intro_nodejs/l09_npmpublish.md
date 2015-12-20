可以將自己的module發佈到npmjs.org供使用.
1. 設置package.json
```
npm init
```
回答有關問題
1. 新建user account
```
npm addurser
```
1. 發佈
```
npm publish
```
1. 升級
改動代碼之後在package.json中設置新版本號,然後重複上一步
```
npm publish
```

1. 使用
```
npm install package-name
```
