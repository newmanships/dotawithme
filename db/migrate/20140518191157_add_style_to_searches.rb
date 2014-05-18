class AddStyleToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :style, :string, :default => 'Any'
  end
end
