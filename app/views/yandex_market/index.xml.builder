xml.instruct!
xml.declare! :DOCTYPE, :yml_catalog, :SYSTEM, 'http://fe-vrn.ru/yandex_market.dtd'

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
        xml.offer(id: product.id) do
          xml.url category_product_url(product.category, product, host: @host, port: nil)
          xml.price product.price.to_i
          xml.currencyId 'RUR'
          xml.categoryId product.category_id
          xml.picture "http://#{@host}#{product.main_photo.medium.url}" if product.picture
          xml.delivery 'true'
          xml.local_delivery_cost 0
        end
      end
    end

  end

end
