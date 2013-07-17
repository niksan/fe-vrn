class Cart::ItemsController < ApplicationController

  def create
    @cart.add(params[:id])
  end  

end
