class GameMailer < ApplicationMailer
  def deer_assignment
    @user = User.find(params[:user_id])
    @friend = User.find(params[:friend_id])
    mail(to: @user.email, subject: 'DESCUBRE QUIEN TE TOCÓ')
  end

  def hint_mail
  end
end