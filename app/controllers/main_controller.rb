class MainController < ApplicationController
  authorize_resource class: 'Product'
  
  def index
    @products = Product.main_page
  end

end
