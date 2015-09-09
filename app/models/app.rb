class App < ActiveRecord::Base
  has_and_belongs_to_many :hosts

  scope :latest, lambda { all.limit(9).order("id DESC") }
end
