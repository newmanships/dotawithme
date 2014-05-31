class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :recipient
      t.string :from
      t.text :note
      t.belongs_to :player
      t.timestamps
    end
  end
end
