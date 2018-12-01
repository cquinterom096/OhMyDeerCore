class AddGameInfoToGameRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :game_rooms, :address, :string
    add_column :game_rooms, :end_date, :string
  end
end
