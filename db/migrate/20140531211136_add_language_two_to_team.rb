class AddLanguageTwoToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :languageTwo, :string, :default => 'None'
  end
end
