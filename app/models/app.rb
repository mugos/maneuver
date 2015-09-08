class App < ActiveRecord::Base
  scope :latest, lambda { all.limit(9).order("id DESC") }
  has_many :hosts
end
