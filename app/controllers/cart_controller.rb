class CartController < ApplicationController

  def index
    redirect_to root_path if @cart.empty?
  end

end
