class PagesController < ApplicationController
  def show
    @page = Page.find params[:id]
    @meta_tag_content[:title] = @page.title
    @meta_tag_content[:keywords] = @page.title.split.join(' ')
  end
end
