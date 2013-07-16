class CartItemsController < ApplicationController

  def create
    @cart.add(params[:id])
    logger.info @cart.items.size > 0
  end  

end
