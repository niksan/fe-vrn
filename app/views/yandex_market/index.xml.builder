xml.instruct!
xml.declare! :DOCTYPE, :yml_catalog, :SYSTEM, "http://fe-vrn.ru/yandex_market.dtd"

xml.yml_catalog "date" => @date do
  
  xml.shop do
  
    xml.name @shop_name

  end

end
