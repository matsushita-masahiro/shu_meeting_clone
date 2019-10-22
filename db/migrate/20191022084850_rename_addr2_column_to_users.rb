class RenameAddr2ColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :addr2, :address_building
  end
end
