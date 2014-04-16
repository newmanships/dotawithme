class AddSolommrToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :solommr, :integer
  end
end
