class SitemapController < ApplicationController
  
  def index
    @articles = Article.all
    @pages = Page.for_menu
    @products = Product.includes(:category).order(:category_id)
    @categories = Category.roots.order(:position)
    respond_to :xml
  end

end
