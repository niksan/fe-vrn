class Product < ActiveRecord::Base
  validates :name, :price, :category_id, presence: true
  validates :lot, uniqueness: true, allow_blank: true
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  serialize :related_products, Array
  has_many :photos, dependent: :destroy
  belongs_to :category
  has_one :yandex_market_info
  accepts_nested_attributes_for :yandex_market_info, :photos, allow_destroy: true
  
  default_scope -> { where(disabled: false).order('category_id, price, name') }
  scope :main_page, -> { where(show_on_main_page: true) }

  def yandex_marker_ready?
    if y_m = self.yandex_market_info
      y_m.model && !y_m.empty?
    end
  end
  
  def related_products_enum
    Product.order(:name).map { |p| [p.name, p.id] }
  end

  def related
    self.class.includes(:category).find(self[:related_products][1..-1])
  end

  def has_related?
    related.size > 0
  end

  def photos_count
    photos.count
  end

  def main_photo
    photos.first.try(:image) || false
  end

  def photos?
    photos.size > 0
  end

  def more_photos?
    photos.size > 1
  end

  def more_photos
    photos[1..-1]
  end

  def destroy
    update_attributes(disabled: true)
  end
  alias destroy! destroy

end
