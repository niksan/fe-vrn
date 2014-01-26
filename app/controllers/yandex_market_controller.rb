class YandexMarketController < ApplicationController
  
  def index
    @shop_name = 'Свободная энергия'
    @date = Time.zone.now.strftime("%Y-%m-%d %H:%M")
    respond_to :xml
  end

end
