(from node.js in practice)
to run:
```
cat file.name | coffee thisfile.coffee.md
```

    process.stdin.resume()
    process.stdin.setEncoding 'utf8'

    process.stdin.on 'data', (data)->
      process.stdout.write data.toUpperCase()

可以用管道命令來蒐集錯誤報告,不用在程序中費事.
