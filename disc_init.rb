ENV['DISQUE_NODES'] = ENV['DISQUE_1_PORT_7711_TCP_ADDR'] +':7711'

require ::File.expand_path('../config/environment', __FILE__)
require 'ohm'

Dir['./jobs/**/*.rb'].each { |job| require job }
