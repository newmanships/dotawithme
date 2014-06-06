class AddLanguageTwoToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :languageTwo, :string
  end
end
