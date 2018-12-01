# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  game_room_id :integer
#  name         :string
#  email        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deer_id      :integer
#

class User < ApplicationRecord
  belongs_to :game_room
  has_many :hints
end
