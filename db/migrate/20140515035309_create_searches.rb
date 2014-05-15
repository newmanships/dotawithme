class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.boolean :one
      t.boolean :two
      t.boolean :three
      t.boolean :four
      t.boolean :five
      t.string :language
      t.string :location

      t.timestamps
    end
  end
end
