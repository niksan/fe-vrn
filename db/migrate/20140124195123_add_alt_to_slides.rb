class AddAltToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :alt, :string
  end
end
