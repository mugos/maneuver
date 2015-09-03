ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require "minitest/rails"
require "minitest/rails/capybara" # loads Capybara, etc.

require "pp"

Rails.backtrace_cleaner.remove_silencers!

# minitest-reporters
require "minitest/reporters"
Minitest::Reporters.use!

Cell::TestCase.class_eval do
  include Capybara::DSL
  include Capybara::Assertions
end
