class RenameTypeToVendorInMarket < ActiveRecord::Migration
  def change
    rename_column :markets, :type, :vendor
  end
end
