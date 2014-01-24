class CategoriesController < ApplicationController
  authorize_resource

  def show
    @category = Category.for_category(params[:id])
    @meta_tag_content[:title] = @meta_tag_content[:title_prefix] + @category.name
    @meta_tag_content[:keywords] = (@meta_tag_content[:keywords_prefix].split + @category.name.split).join(' ')
  end

end
