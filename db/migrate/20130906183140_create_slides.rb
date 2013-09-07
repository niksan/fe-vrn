class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :ancestry
      t.integer :position
      t.string :image

      t.timestamps
    end
  end
end
