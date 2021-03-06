class CartController < ApplicationController

  def index
    redirect_to root_path if @cart.empty?
  end
  def update
    params[:cart_items].each do |item, quantity|
      current_item = @cart.item(item.to_i)
      @cart.delete_by_id(current_item) if quantity.to_i == 0
      current_item.quantity = quantity.to_i if current_item
    end
    gflash notice: t('cart.updated')
    redirect_to cart_index_path
  end

end
