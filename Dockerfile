FROM ruby:2.6-alpine

RUN apk add git build-base ruby-json ruby-etc postgresql-dev

RUN mkdir /app
WORKDIR   /app

COPY ["Gemfile", "Gemfile.lock", "/app/"]

RUN bundle install

COPY [".", "/app"]

ENTRYPOINT ["bundle", "exec", "rake"]
