class CategoriesController < ApplicationController
  authorize_resource

  def show
    @category = Category.for_category(params[:id])
    @meta_tag_content[:title] = @meta_tag_content[:title_prefix] + @category.name
  end

end
