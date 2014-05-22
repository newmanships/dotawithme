class AddLanguageTwoToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :languageTwo, :string, :default => 'None'
  end
end
