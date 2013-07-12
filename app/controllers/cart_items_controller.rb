class CartItemsController < ApplicationController

  def create
    @cart.add(params[:id])
  end  

end
