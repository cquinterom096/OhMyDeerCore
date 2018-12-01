# == Schema Information
#
# Table name: game_rooms
#
#  id         :integer          not null, primary key
#  access_key :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GameRoom < ApplicationRecord
  has_many :users
  has_many :hints, through: :users
end
