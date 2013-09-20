class FeedbackController < ApplicationController
  
  def create
    FeedbackMailer.message_to_email(params[:feedback]).deliver
    flash[:success] = t('feedback.send.success')
    redirect_to contacts_path
  end

end
