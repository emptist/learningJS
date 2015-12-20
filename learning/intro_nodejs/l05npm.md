## npm install 安裝 modules

### 本地安裝

```
cd project
npm install underscore
```
安裝到 node_modules.這是本地安裝,每個項目可以安裝一套庫.

也可以全局安裝,這有點繞,npm主頁說如果需要從命令行執行,就全局裝,如果從程序徵用, require就本地裝.
那不需要命令行的都是本地裝?所以這個幫助文件可能寫錯了.

### 全局安裝

```
npm install -g coffee-script
```
有時候會說權限不夠,這時不要用 sudo, 而是採用改權限的方法,參閱npmjs.org文檔,我書裡面有寫,此處
先空著:
```
npm chown
```

### 升級

```
npm update coffee-script
```
