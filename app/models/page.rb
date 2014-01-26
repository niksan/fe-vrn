class Page < ActiveRecord::Base
  has_ancestry
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  validates :key, uniqueness: true
  default_scope -> { order(:position) }
  scope :for_menu, -> { where(show_in_menu: true) }
  DEF_EXCLUDEDS = %w(contacts)

  class << self
    
    def contacts
      where(key: 'contacts').first
    end
    
    def with_key(key)
      where(key: key.to_s).first
    end

    def without_excluded(excluded = [])
      where('key NOT IN (?)', DEF_EXCLUDEDS)
    end

  end

end
