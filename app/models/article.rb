class Article < ActiveRecord::Base
  has_ancestry
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  validates :title, presence: true
  default_scope -> { order(:position) }
end
