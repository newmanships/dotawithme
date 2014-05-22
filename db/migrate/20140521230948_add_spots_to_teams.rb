class AddSpotsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :one, :boolean
    add_column :teams, :two, :boolean
    add_column :teams, :three, :boolean
    add_column :teams, :four, :boolean
    add_column :teams, :five, :boolean
  end
end
