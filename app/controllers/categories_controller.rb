class CategoriesController < ApplicationController
  authorize_resource

  def show
    @category = Category.for_category(params[:id])
    @meta_tag_content[:title] = @meta_tag_content[:title_prefix] + @category.name
    @meta_tag_content[:keywords] = @category.name.split.join(' ')
  end

end
