FROM ruby:3.3.6

RUN apt-get update -qq && apt-get install --no-install-recommends -y nodejs yarn postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /jobs
WORKDIR /jobs

COPY Gemfile /jobs/Gemfile
COPY Gemfile.lock /jobs/Gemfile.lock
RUN gem install bundler -v 2.3.26
RUN bundle install

COPY . /jobs

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
