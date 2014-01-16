class MainController < ApplicationController
  authorize_resource class: 'Product'
  
  def index
    @page = Page.with_key(:main)
    @products = Product.main_page
  end

end
