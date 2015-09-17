# require 'config/initializers/disc.rb'
ENV['DISQUE_NODES'] = ENV['DISQUE_PORT']

require ::File.expand_path('../config/environment', __FILE__)
require 'ohm'

Dir['./jobs/**/*.rb'].each { |job| require job }
