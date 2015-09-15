class Build < ActiveRecord::Base
  belongs_to :app
  belongs_to :host
end
