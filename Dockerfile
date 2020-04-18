FROM ruby:2.5.1

RUN apt-get update && \
    apt-get install -y mysql-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /crn

WORKDIR /crn

ADD Gemfile /crn/Gemfile
ADD Gemfile.lock /crn/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /crn
