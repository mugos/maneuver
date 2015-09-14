class Hosted < ActiveRecord::Base
  self.table_name = :apps_hosts

  belongs_to :app
  belongs_to :host
end
