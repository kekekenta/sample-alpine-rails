# Railsサンプルアプリケーション on alpine

## 初回

### DB の作成
```
$ docker-compose run app rake db:create
$ docker-compose run app rake db:migrate RAILS_ENV=development
$ docker-compose run app rake db:migrate RAILS_ENV=test
```

### コンテナの立ち上げ
```
$ docker-compose up -d
$ open http://localhost:3000
=> Yay! You’re on Rails!
```

## 開発

### bundle install
Gemfile を変更した際には、コンテナ内で bundle install を実行する。

```
# コンテナ内で bundle install し、 Gemfile.lock を更新
$ docker-compose exec app bundle install
```

- docker-compose build では、ホストの Gemfile.lock をイメージにコピーした上で bundle install を実行するため、ホストの Gemfile.lock は更新されない。

### test
```
$ docker-compose exec app rspec
```

## 参考

### rails new 時に実行したコマンド

```
$ docker-compose run app rails new . --api --database=mysql
$ docker-compose build app
```
