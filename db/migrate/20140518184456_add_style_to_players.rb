class AddStyleToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :style, :string, :default => 'Any'
  end
end
