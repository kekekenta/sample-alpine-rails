## bundle install
Gemfile を更新後、docker build しただけでは Gemfile.lock が更新されない。
※ マウントしているため、ホストの Gemfile.lock で上書きされてしまう

```
docker run  -it -v $PWD:/var/app test/sample-alpine bundle install
```
