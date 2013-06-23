class Product < ActiveRecord::Base
  attr_accessible :description, :lot, :name, :price
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: :slugged
end
