FROM ruby:2.3.1-alpine

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash su-exec" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev" \
    RUBY_PACKAGES="ruby-json yaml nodejs"

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache \
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES && \
    mkdir -p /var/app && \
    adduser -D rails && addgroup rails rails

WORKDIR /var/app
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN chown -R rails:rails . && \
    su-exec rails bundle install -j4

COPY . .
RUN chown -R rails:rails .
USER rails
