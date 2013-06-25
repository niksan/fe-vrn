class Product < ActiveRecord::Base
  attr_accessible :description, :lot, :name, :price, :related_products
  validate :name, :price, presence: true
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: :slugged
  serialise :related_products, Array
end
