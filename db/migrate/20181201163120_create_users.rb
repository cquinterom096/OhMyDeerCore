class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.references :game_room, foreign_key: true
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
