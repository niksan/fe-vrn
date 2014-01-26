class Slide < ActiveRecord::Base
  has_ancestry
  mount_uploader :image, SlideUploader
  default_scope -> { order(:position) }
end
