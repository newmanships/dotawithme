class AddOnlineToPlayers < ActiveRecord::Migration
  def self.up
	  add_column :players, :online, :boolean
  end
  
  def self.down
	  remove_column :players, :online, :boolean
  end
end
