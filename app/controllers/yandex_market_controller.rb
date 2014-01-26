class YandexMarketController < ApplicationController
  
  def index
    @shop_name = 'Свободная энергия'
    @host = 'fe-vrn.ru'
    @date = Time.zone.now.strftime("%Y-%m-%d %H:%M")
    @categories = Category.all
    @products = Product.all
    respond_to :xml
  end

end
