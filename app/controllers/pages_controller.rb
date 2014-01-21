class PagesController < ApplicationController
  def show
    @page = Page.find params[:id]
    @meta_tag_content[:title] = @page.title
  end
end
