class Product < ActiveRecord::Base
  attr_accessible :description, :lot, :name, :price, :related_products, :category_id, :photos_attributes
  validates :name, :price, :category_id, presence: true
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: :slugged
  serialize :related_products, Array
  has_many :photos, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :photos, allow_destroy: true

  default_scope order(:name)
  
  def related_products_enum
    Product.order(:name).map { |p| [p.name, p.id] }
  end

  def related_products
    self[:related_products][1..-1]
  end

end
