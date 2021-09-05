ddd実装練習
# start

```
bundle exec rackup presentation/config.ru
```

### test commnand

```
# create user
curl -XPOST localhost:9292/user -d '{"name":"user01","mail":"user01@mail.domain"}'
```

```
# show user
curl -XGET localhost:9292/user/user01
```