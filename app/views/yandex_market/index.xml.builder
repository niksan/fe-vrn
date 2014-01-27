xml.instruct!
xml.declare! :DOCTYPE, :yml_catalog, :SYSTEM, 'shops.dtd'

xml.yml_catalog date: @date do
  
  xml.shop do
  
    xml.name @shop_name
    xml.company @shop_name
    xml.url root_url(host: @host, port: nil)

    xml.currencies do
      xml.currency id: 'RUR', rate: 1, plus: 0
    end

    xml.categories do
      @categories.each do |category|
        cat_params = { id: category.id }
        cat_params[:parent_id] = category.parent_id if category.parent_id
        xml.category(category.name, cat_params)
      end
    end

    xml.local_delivery_cost 0

    xml.offers do
      @products.each do |product|
        if product.yandex_market_ready?
          xml.offer(id: product.id, type: 'vendor.model') do
            xml.url category_product_url(product.category, product, host: @host, port: nil)
            xml.name product.name
            xml.price product.price.to_i
            xml.currencyId 'RUR'
            xml.categoryId product.category_id
            xml.picture "http://#{@host}#{product.main_photo.medium.url}" unless product.photos.empty?
            xml.delivery 'true'
            xml.local_delivery_cost 0
            xml.vendor product.yandex_market_info.firm.name
            xml.model product.yandex_market_info.model
          end
        end
      end
    end

  end

end
