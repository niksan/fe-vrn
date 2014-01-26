class YandexMarketInfo < ActiveRecord::Base
  belongs_to :product
  belongs_to :firm
  validates :firm_id, presence: true
  accepts_nested_attributes_for :product
end
