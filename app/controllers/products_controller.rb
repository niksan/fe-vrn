class ProductsController < ApplicationController
  authorize_resource

  def show
    @product = Product.includes(:category, :photos).find(params[:id])
    @meta_tag_content[:title] = @meta_tag_content[:title_prefix] + @product.name
  end

end
