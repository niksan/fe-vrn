class CartItemsController < ApplicationController

  def create
    @cart.add(params[:id])
    render nothing: true
  end  

end
