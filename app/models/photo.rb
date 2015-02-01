class Photo < ActiveRecord::Base
  validates :image, presence: true
  has_ancestry
  mount_uploader :image, PhotoUploader
  belongs_to :product

  default_scope -> { order('created_at') }

#  def id #TODO починить это говно. Без этого не работает edit в админке у товара
#    super.to_s
#  end

end
