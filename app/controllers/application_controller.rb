class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_menu_items, :initialize_cart
  
  private
    
    def initialize_cart
      @cart = session[:cart] ||= Cart.new
    end

    def find_menu_items
      @pages = Page.all
      @root_categories = Category.roots.order(:position)
      @articles = Article.all
    end

end
