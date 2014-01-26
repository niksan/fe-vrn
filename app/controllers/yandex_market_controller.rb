class YandexMarketController < ApplicationController
  
  def index
    @shop_name = 'Свободная энергия'
    @host = 'fe-vrn.ru'
    @date = Time.zone.now.strftime("%Y-%m-%d %H:%M")
    @categories = Category.all
    @products = Product.includes(:category, :photos)
    respond_to :xml
  end

end
