# Ruby Image
FROM ruby:2.2.0

# Install essential stuff for Rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install Bundler
RUN gem install bundler --no-ri --no-rdoc

# Install Rails
RUN gem install rails -v 4.2.0 --no-ri --no-rdoc

# Queues names
ENV QUEUES=urgent,build,default

# Define Home
ENV APP_HOME /app

# Create Home
RUN mkdir $APP_HOME

# Define workdr
WORKDIR $APP_HOME

# Env for Bundle
ENV BUNDLE_PATH /data

# Andd rest
ADD . $APP_HOME

# Run assync
RUN disc -r ./disc_init.rb

# RUN Rails
CMD rails s -p 3000 -b '0.0.0.0'
