class Order::Item < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity
  validates :order_id, :price, :product_id, :quantity, presence:true

  has_many :items, dependent: :destroy
end
