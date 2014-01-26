class CreateYandexMarketInfos < ActiveRecord::Migration
  def change
    create_table :yandex_market_infos do |t|
      t.integer :product_id
      t.integer :firm_id
      t.string :model

      t.timestamps
    end
  end
end
