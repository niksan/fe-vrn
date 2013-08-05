class OrderMailer < ActionMailer::Base
  default from: "Free Energy <shop@fe-vrn.ru>"

  def order(order_datas, cart_datas)
    @order_datas = order_datas
    @cart_datas = cart_datas
    mail(to: 'info@niksan.ru', subject: 'Заказ из интернет-магазина.')
  end

end