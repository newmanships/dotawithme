class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :rank
      t.text :description
      t.string :location
      t.string :language
      t.text :defaultMessage
      t.string :leaderSteamID

      t.timestamps
    end
  end
end
