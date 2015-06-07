class AddDefaultValueToOnlineAttribute < ActiveRecord::Migration
	def up
	  change_column :players, :online, :boolean, :default => false
	end
	
	def down
	  change_column :players, :online, :boolean, :default => nil
	end
end
