class YandexMarketInfo < ActiveRecord::Base
  attr_accessible :firm_id, :model, :product_id, :products_attributes
  belongs_to :product
  belongs_to :firm
  validates :firm_id, presence: true
  accepts_nested_attributes_for :product
end
