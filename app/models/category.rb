class Category < ActiveRecord::Base
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  validates :name, presence: true
  default_scope -> { order(:position) }
  has_many :products, dependent: :destroy

  class << self
    def for_category(cat)
      includes(:products).find(cat)
    end
  end

end
