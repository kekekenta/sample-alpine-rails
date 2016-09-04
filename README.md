# Railsサンプルアプリケーション on alpine

## 初回
DB の作成
```
$ docker-compose run app rake db:create
$ docker-compose run app rake db:migrate RAILS_ENV=development
$ docker-compose run app rake db:migrate RAILS_ENV=test
```

## test
```
$ docker-compose run app rspec
```

## bundle install
Gemfile を更新後、docker build しただけでは Gemfile.lock が更新されない。
※ マウントしているため、ホストの Gemfile.lock で上書きされてしまう

```
# コンテナ内で bundle install し、 Gemfile.lock を更新
$ docker-compose run app bundle install

#　Gemfile.lock をもとにイメージをビルド
$ docker-compose build app
```


## 参考: rails new 時に実行したコマンド
```
$ docker-compose run app rails new . --api --database=mysql
$ docker-compose build app
```
