class Photo < ActiveRecord::Base
  validates :image, presence: true
  has_ancestry
  mount_uploader :image, PhotoUploader
  belongs_to :product

  default_scope -> { order('created_at') }

  def id
    super.to_s
  end

end
