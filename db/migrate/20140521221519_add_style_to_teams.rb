class AddStyleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :style, :string
  end
end
