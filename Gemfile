source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "4.2.0"
# Use pg as the database for Active Record
gem 'pg'
# Use SqLite for development
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# A set of Rails responders to dry up your application
gem "responders"
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.
gem "simple_form"
# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Trailblazer
gem 'trailblazer'
# View components for Ruby and Rails
gem "cells", "4.0.2"
# Because of well well
gem "cells-haml", "0.0.8"
# Haml
gem "haml", github: "haml/haml", ref: "7c7c169"
# Haml Rails
gem "haml-rails"
# Form objects decoupled from models.
gem "reform", github: 'apotonick/reform'
# Parse and render REST API documents using representers.
gem 'roar'
# Monban is rails authentication made simple.
gem 'monban'
# Agnostic authentication gem with signup, signin, forgot password, sticky login, and so on.
gem 'tyrant'
# Task Runner
gem 'caracara', github: 'gabrielcorado/caracara'
# A Ruby wrapper for the BitBucket REST API
gem "bitbucket_rest_api"
# Disc fills the gap between your Ruby service objects and antirez's wonderful Disque backend.
gem 'disc'
# Object-hash mapping library for Redis.
gem 'ohm'
# Uses the fast and compact msgpack binary format to let you serialize objects.
gem 'msgpack_rails'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # awesome_print
  gem 'awesome_print'
end

group :test do
  # minitest
  gem 'minitest-line'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest-rails-capybara'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
