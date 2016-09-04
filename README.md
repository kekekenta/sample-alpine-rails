## bundle install
Gemfile を更新後、docker build しただけでは Gemfile.lock が更新されない。
※ マウントしているため、ホストの Gemfile.lock で上書きされてしまう

```
$ docker-compose run rails bundle install
```
