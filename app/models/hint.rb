# == Schema Information
#
# Table name: hints
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  link       :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hint < ApplicationRecord
  belongs_to :user
end
