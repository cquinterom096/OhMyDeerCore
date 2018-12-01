class CreateGameRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :game_rooms do |t|
      t.string :access_key

      t.timestamps
    end
  end
end
