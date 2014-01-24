xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc "http://fe-vrn.ru"
    xml.priority 1.0
  end

  @pages.each do |page|
    xml.url do
      xml.loc page_url(page)
      xml.priority 0.9
    end
  end

  @categories.each do |category|
    xml.url do
      xml.loc category_url(category)
      xml.priority 0.9
    end
  end

  @products.each do |product|
    xml.url do
      xml.loc category_product_url(product.category, product)
      xml.priority 0.9
    end
  end

  @articles.each do |article|
    xml.url do
      xml.loc article_url(article)
      xml.priority 0.9
    end
  end

end
