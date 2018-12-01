class CreateHints < ActiveRecord::Migration[5.0]
  def change
    create_table :hints do |t|
      t.references :user, foreign_key: true
      t.string :link
      t.text :message

      t.timestamps
    end
  end
end
