class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :ancestry
      t.string :slug
      t.integer :position

      t.timestamps
    end
  end
end
