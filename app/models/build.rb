class Build < ActiveRecord::Base
  belongs_to :app
  belongs_to :host

  scope :latest, lambda { all.limit(9).order("id DESC") }
end
