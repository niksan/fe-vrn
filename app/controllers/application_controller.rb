class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_menu_items, :initialize_cart, :find_slides
  
  private
    
    def initialize_cart
      @cart = session[:cart] ||= Cart.new
    end

    def find_menu_items
      @pages = Page.all
      @root_categories = Category.roots.order(:position)
      @articles = Article.all
    end

    def find_slides
      @slides = Slide.all
    end

end
