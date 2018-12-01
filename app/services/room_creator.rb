class RoomCreator
  attr_reader :users, :players, :title

  def initialize(data)
    @users = data[:players]
    @title = data[:title]
    @players = []
  end

  def execute
    setup_game_room
    players.first.id
  end

  private

  def friend
    @friend ||= players.find { |user| user.deer_id == players.first.id }
  end

  def game_room
    @game_room ||= GameRoom.create(title: title)
  end

  def setup_game_room
    setup_participants
    shuffle_deers
    send_email_to_users
  end

  def setup_participants
    users.each do |user|
      @players << game_room.users.create(name: user[:name], email: user[:email])
    end
  end

  def shuffle_deers
    DeerShuffler.new(@players, game_room.users.pluck(:id)).execute
  end

  def send_email_to_users
    @players.each do |user|
      GameMailer.deer_assignment(
        user.id, user.deer_id
      ).deliver_later
    end
  end
end