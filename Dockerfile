FROM ruby:2.4.1

ENV APP_HOME /village

RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev nodejs && \
  mkdir /$APP_HOME

WORKDIR /$APP_HOME
ADD Gemfile /$APP_HOME/Gemfile
ADD Gemfile.lock /$APP_HOME/Gemfile.lock

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install
ADD . /$APP_HOME