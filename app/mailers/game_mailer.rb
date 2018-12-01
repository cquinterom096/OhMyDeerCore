class GameMailer < ApplicationMailer
  def deer_assignment(user_id, friend_id)
    @user = User.find(user_id)
    @game_room = @user.game_room
    @friend = User.find(friend_id)
    @url = "https://ohmydeer.herokuapp.com/game_room/#{@user.id}"
    mail(to: @user.email, subject: 'DESCUBRE QUIEN TE TOCÓ')
  end

  def send_hint(user_id, friend_id, hint_id)
    @user = User.find(user_id)
    @friend = User.find(friend_id)
    @hint = Hint.find(hint_id)
    @url = "https://ohmydeer.herokuapp.com/#{@user.id}"
    mail(to: @friend.email, subject: 'TU RENO SECRETO TE ENVIÓ ALGO')
  end
end