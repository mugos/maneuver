require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Maneuver
  class Application < Rails::Application
    # Disc fills the gap between your Ruby service objects and antirez's wonderful Disque backend.
    require 'active_job/queue_adapters/disc_adapter'
    config.active_job.queue_adapter = :disc
    ENV['DISQUE_NODES'] = ENV['DISQUE_1_PORT_7711_TCP_ADDR'] +':7711'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Add Caracara Tasks
    config.paths.add File.join('app', 'tasks'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'tasks', '*')]

    # Add Caracara Groups
    config.paths.add File.join('app', 'group'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'group', '*')]
  end
end

# railties have to be loaded here.
require 'trailblazer/rails/railtie'
