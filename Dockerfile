FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install --no-install-recommends -y nodejs postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add Yarn from its official source to prevent cmdtest issues
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install --no-install-recommends -y yarn=1.22.22 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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
