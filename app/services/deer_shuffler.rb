class DeerShuffler
  attr_reader :user, :participants_ids

  def initialize(users, participants_ids)
    @user = users
    @participants_ids = participants_ids
  end

  def execute
    assign_friends
  end

  private

  def middle_element_position
    @middle_element_position ||= (participants_ids.length/2) + 1
  end

  def reversed_list
    @reversed_list ||= participants_ids.reverse
  end

  def assign_friends
    if participants_ids.length.even?
      users.each_with_index { |user, index| user.update(deer_id: participants_ids[index]) }
    else
      participants_ids[middle_element_position], participants_ids.first =
        participants_ids.first, participants_ids[middle_element_position]
      users.each_with_index { |user, index| user.update(deer_id: participants_ids[index]) }
    end
  end
end
