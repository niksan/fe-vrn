class Order < ActiveRecord::Base
  attr_accessible :additional, :address, :first_name, :last_name, :phone, :email
  validates :first_name, :last_name, :phone, :address, presence: true

  has_many :items, dependent: :destroy
end
