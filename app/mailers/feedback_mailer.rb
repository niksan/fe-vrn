class FeedbackMailer < ActionMailer::Base
  default from: "Free Energy <shop@fe-vrn.ru>"

  def message_to_email(prms = {})
    @name = prms['name']
    @email = prms['email']
    @body = prms['body']
    mail(to: 'fe.vrn.website@gmail.com', subject: 'Сообщение с сайта FE-VRN.RU')
  end

end
