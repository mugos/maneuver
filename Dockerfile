# Ruby Image
FROM ruby:2.2.0

# Install essential stuff for Rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install Bundler
RUN gem install bundler --no-ri --no-rdoc

# Install Rails
RUN gem install rails --no-ri --no-rdoc

# Make the app folder
RUN mkdir app/

# Set workdir
WORKDIR app/

# Add Gemfile
ADD Gemfile Gemfile

# Bundle install it
RUN bundle install

# Add the rest of the source
ADD . .
