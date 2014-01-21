class ArticlesController < ApplicationController

  def show
    @article = Article.find params[:id]
    @meta_tag_content[:title] = @article.title
  end

  private

    def set_seo_data
    end

end
