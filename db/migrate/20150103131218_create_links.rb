class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :type
      t.string :url
      t.references :hub, index: true

      t.timestamps null: false
    end
    add_foreign_key :links, :hubs
  end
end
