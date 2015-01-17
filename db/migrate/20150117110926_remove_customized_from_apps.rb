class RemoveCustomizedFromApps < ActiveRecord::Migration
  def change
    remove_column :apps, :customized
  end
end
