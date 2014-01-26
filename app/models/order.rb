class Order < ActiveRecord::Base
  attr_reader :name
  validates :first_name, :last_name, :phone, :address, presence: true

  has_many :items, dependent: :destroy

  state_machine :state, initial: :initialized do
    
    state :initialized, :inprogress, :finished

    event :finish do
      transition all => :finished
    end

  end
  
  def state_enum
    [[ 'Новый заказ', 'initialized'], ['В работе', 'inprogress'], ['Завершен', 'finished']] 
  end

  def name
    self.class.model_name.human + " #" + id.to_s
  end

end
