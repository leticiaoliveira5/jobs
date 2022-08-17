FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y nodejs sqlite3 libsqlite3-dev yarn 

RUN mkdir /jobs
WORKDIR /jobs

COPY Gemfile* package.json yarn.lock /jobs/

RUN gem install bundler -v 2.2.15 && \
  bundle install --jobs 20

COPY . /jobs

RUN bundle exec rails db:setup