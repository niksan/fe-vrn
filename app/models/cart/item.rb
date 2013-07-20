class Cart::Item < ActiveResource::Base

  attr_reader :product, :product_id
  attr_accessor :quantity

  def initialize(product_id, quantity=1)
    @product_id = product_id
    @quantity = quantity.to_i
  end

  def product
    @product ||= Product.find(self.product_id)
  end

  def increment_quantity(quantity)
    @quantity += quantity
  end

  def name
    product.name
  end

  def price
    product.price * @quantity.to_i
  end

  def delete!
    puts self.class.objects
  end

end
