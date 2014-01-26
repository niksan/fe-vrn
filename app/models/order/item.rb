class Order::Item < ActiveRecord::Base
  validates :order_id, :price, :product_id, :quantity, presence: true
  belongs_to :product
  belongs_to :order

  def name
    "#{product.name}, #{quantity} шт., #{price} руб."
  end
  alias_method :label, :name

  def price
    read_attribute(:price).to_f
  end

end
