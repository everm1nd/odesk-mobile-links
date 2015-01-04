class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :type
      t.string :link
      t.references :hub, index: true

      t.timestamps null: false
    end
    add_index :markets, :type
    add_foreign_key :markets, :hubs
  end
end
