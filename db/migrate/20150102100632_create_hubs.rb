class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|

      t.timestamps null: false
    end
  end
end
