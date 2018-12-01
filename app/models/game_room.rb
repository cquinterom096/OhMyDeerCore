class GameRoom < ApplicationRecord
  has_many :users
  has_many :hints, through: :users
end
