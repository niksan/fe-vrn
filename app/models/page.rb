class Page < ActiveRecord::Base
  attr_accessible :body, :title, :key
  has_ancestry
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  validates :key, uniqueness: true
  default_scope order(:position)
  DEF_EXCLUDEDS = %w(contacts)

  class << self
    
    def contacts
      where(key: 'contacts').first
    end

    def without_excluded(excluded = [])
      where('key NOT IN (?)', DEF_EXCLUDEDS)
    end

  end

end
