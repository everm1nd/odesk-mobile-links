class AddHashidToApps < ActiveRecord::Migration
  def change
    add_column :apps, :hashid, :string
  end
end
