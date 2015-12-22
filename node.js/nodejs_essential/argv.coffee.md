## process.argv
process是一個全局變量

    console.log process.argv

    grab = (flag)->
      index = process.argv.indexOf flag
      if index is -1 then null else process.argv[index+1]

    greeting = grab '--greeting'
    user = grab '--user'

    unless user? and greeting?
      console.log '沒有'
    else
      console.log "welcome #{user}, #{greeting}"

```
coffee argv.coffee.md --user jim --greeting hello
```
