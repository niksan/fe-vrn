class OrdersController < ApplicationController

  def new; end

  def create
    begin
      ActiveRecord::Base.transaction do
        @order = Order.new(params[:order])
        @order.save!
        @cart.items.each do |item|
          Order::Item.create!(product_id: item.product_id,
                              quantity: item.quantity,
                              price: item.price,
                              order_id: @order.id)
        end
      end
      flash[:success] = t('order.save.success')
      @cart.empty!
      redirect_to root_path
     rescue
       flash[:error] = t('order.save.error')
       render :new
     end
   end

end
