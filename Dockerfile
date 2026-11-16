FROM ruby:4.0.9

RUN apt-get update -qq && apt-get install --no-install-recommends -y nodejs npm postgresql-client \
    && npm install -g yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /jobs
WORKDIR /jobs

COPY Gemfile /jobs/Gemfile
COPY Gemfile.lock /jobs/Gemfile.lock
RUN bundle install

COPY . /jobs

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
