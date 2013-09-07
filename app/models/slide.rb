class Slide < ActiveRecord::Base
  attr_accessible :image, :image_cache, :remove_image
  has_ancestry
  mount_uploader :image, SlideUploader
  default_scope order(:position)
end
