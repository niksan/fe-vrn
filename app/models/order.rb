class Order < ActiveRecord::Base
  attr_accessible :additional, :address, :first_name, :last_name, :phone
  validates :first_name, :last_name, :phone, :address, presence: true
end
