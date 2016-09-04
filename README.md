## bundle install
Gemfile を更新後、docker build しただけでは Gemfile.lock が更新されない。
※ マウントしているため、ホストの Gemfile.lock で上書きされてしまう

```
# コンテナ内で bundle install し、 Gemfile.lock を更新
$ docker-compose run app bundle install

#　Gemfile.lock をもとにイメージをビルド
$ docker-compose build app
```
