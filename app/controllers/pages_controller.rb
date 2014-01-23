class PagesController < ApplicationController
  def show
    @page = Page.find params[:id]
    @meta_tag_content[:title] = @meta_tag_content[:title_prefix] + @page.title
  end
end
