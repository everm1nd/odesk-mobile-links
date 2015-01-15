class AddCustomizedToApps < ActiveRecord::Migration
  def change
    add_column :apps, :customized, :boolean, default: false
  end
end
