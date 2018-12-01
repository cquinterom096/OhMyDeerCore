class User < ApplicationRecord
  belongs_to :game_room
  has_many :hints
end
