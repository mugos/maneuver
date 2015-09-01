# Ruby Image
FROM ruby:2.2.0

# Install essential stuff for Rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install Bundler
RUN gem install bundler --no-ri --no-rdoc

# Install Rails
RUN gem install rails --no-ri --no-rdoc

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
