class DeerShuffler
  attr_reader :users, :participants_ids

  def initialize(users, participants_ids)
    @users = users
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
      users.each_with_index { |user, index| user.update(deer_id: reversed_list[index]) }
    else
      participants = reversed_list.dup
      t1 = participants[0]
      t2 = participants[middle_element_position]
      participants[0] = t2
      participants[middle_element_position] = participants.first
      #participants[middle_element_position], participants[0] = participants.first, participants[middle_element_position]
      users.each_with_index { |user, index| user.update(deer_id: participants[index]) }
    end
  end
end
