class RenameMarketLinkToUrl < ActiveRecord::Migration
  def change
    rename_column :markets, :link, :url
  end
end
