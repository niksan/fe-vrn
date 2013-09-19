class Page < ActiveRecord::Base
  attr_accessible :body, :title, :key
  has_ancestry
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  validates :key, uniqueness: true
  default_scope order(:position)

  class << self
    
    def contacts
      where(key: 'contacts').first
    end

  end

end
