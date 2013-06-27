class Photo < ActiveRecord::Base
  attr_accessible :image, :product_id
  belongs_to :product
  validates :image, :product_id, presence: true
  has_ancestry
  mount_uploader :image, PhotoUploader
end
