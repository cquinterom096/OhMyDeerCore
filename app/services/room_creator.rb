class RoomCreator
  attr_reader :users, :players

  def initialize(users)
    @users = users
    @players = []
  end

  def execute
    setup_game_room
    players.first
  end

  private

  def game_room
    @game_room ||= GameRoom.create
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
      GameMailer.with(
        user_id: user.id, friend_id: user.deer_id
      ).deer_assignment.deliver_later
    end
  end
end