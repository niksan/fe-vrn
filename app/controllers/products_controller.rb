class ProductsController < ApplicationController
  authorize_resource

  def show
    @product = Product.includes(:category, :photos).find(params[:id])
    @meta_tag_content[:title] = @product.name
    @meta_tag_content[:keywords] = @product.name.split.join(' ')
  end

end
