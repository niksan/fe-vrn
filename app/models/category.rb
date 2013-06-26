class Category < ActiveRecord::Base
  attr_accessible :name
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true
  default_scope order(:position)
end
