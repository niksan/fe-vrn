class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_root_categories
  
  private

    def find_root_categories
      @root_categories = Category.roots.order(:position)
    end

end
