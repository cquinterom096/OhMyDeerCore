class HintCreator
  attr_reader :user, :friend, :hint_body, :hint

  def initialize(user, friend, hint_body)
    @user = user
    @friend = friend
    @hint_body
  end

  def execute
    upsert_hint
    hint&.id
  end

  private

  def upsert_hint
    create_hint
    increase_score
    send_email
  end

  def create_hint
    @hint ||= user.hints.create(message: hint_body[:message], link: hint_body[:link])
  end

  def send_email
    GameMailer.send_hint(user.id, user.deer_id, hint&.id).deliver_later
  end

  def increase_score
    user.score += 10
    user.save
  end
end