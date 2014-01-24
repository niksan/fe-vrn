class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_menu_items, :initialize_cart, :find_slides, :init_meta_tags
  
  private
    
    def initialize_cart
      @cart = session[:cart] ||= Cart.new
    end

    def find_menu_items
      @main_pages = {}
      @main_pages[:contacts] = Page.contacts
      @pages = Page.for_menu
      @root_categories = Category.roots.order(:position)
      @articles = Article.all
    end

    def find_slides
      @slides = Slide.all
    end

    def init_meta_tags
      @meta_tag_content = {}
      @meta_tag_content[:title_prefix] = 'Солнечные батареи, панели. '
      @meta_tag_content[:title] = 'Солнечные батареи, солнечные панели, купить по низким ценам в Воронеже.'
      @meta_tag_content[:keywords_prefix] = 'солнечные батареи панели купить по низким ценам Воронеж'
      @meta_tag_content[:keywords] = 'солнечные батареи панели купить по низким ценам Воронеж'
    end

end
