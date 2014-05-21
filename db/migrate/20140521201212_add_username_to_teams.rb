class AddUsernameToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :username, :string
  end
end
