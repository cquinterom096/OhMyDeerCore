class GameMailer < ApplicationMailer
  def deer_assignment(user_id, friend_id)
    @user = User.find(user_id)
    @friend = User.find(friend_id)
    mail(to: @user.email, subject: 'DESCUBRE QUIEN TE TOCÓ')
  end

  def hint_mail
  end
end