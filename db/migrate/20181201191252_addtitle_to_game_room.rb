class AddtitleToGameRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :game_rooms, :title, :string
  end
end
