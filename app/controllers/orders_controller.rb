class OrdersController < ApplicationController

  def new; end

  def create
    begin
      ActiveRecord::Base.transaction do 
        @order = Order.create!(params[:order])
      end
      act = false
    rescue
      act = true
    end

    if act
      flash[:success] = 'Ваш заказ принят в обработку, спасибо!'
      redirect_to root_path
    else
      flash[:error] = 'Заказ не отправлен.'
      render :new
    end
  end

end
