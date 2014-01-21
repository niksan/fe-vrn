class CategoriesController < ApplicationController
  authorize_resource

  def show
    @category = Category.for_category(params[:id])
    @meta_tag_content[:title] = @category.name
  end

end
