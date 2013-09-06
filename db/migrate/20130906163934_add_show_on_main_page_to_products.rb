class AddShowOnMainPageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :show_on_main_page, :boolean, default: false
  end
end
