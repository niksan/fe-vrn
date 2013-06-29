class Product < ActiveRecord::Base
  attr_accessible :description, :lot, :name, :price, :related_products, :category_id, :photos_attributes
  validates :name, :price, presence: true
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: :slugged
  serialize :related_products, Array
  has_many :photos, dependent: :destroy
  belongs_to :category
end
