class AddDeerIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :deer_id, :integer
  end
end
