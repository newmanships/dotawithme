class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.boolean :one
      t.boolean :two
      t.boolean :three
      t.boolean :four
      t.boolean :five
      t.integer :rank
      t.string :language
      t.string :location
      t.string :playerSteamID
      t.string :username

      t.timestamps
    end
  end
end
