class ProductsController < ApplicationController
  authorize_resource

  def show
    @product = Product.includes(:category, :photos).find(params[:id])
    @meta_tag_content[:title] = @product.name
  end

end
