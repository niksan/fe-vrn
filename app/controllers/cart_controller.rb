class CartController < ApplicationController

  def index
    redirect_to root_path if @cart.empty?
  end

  def update
    params[:cart_items].each do |item, quantity|
      @cart.item(item.to_i).delete! if quantity.to_i == 0
      @cart.item(item.to_i).quantity = quantity.to_i
    end
    gflash notice: t('cart.updated')
    redirect_to cart_index_path
  end

end
