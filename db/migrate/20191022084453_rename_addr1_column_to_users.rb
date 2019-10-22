class RenameAddr1ColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :addr1, :address_street
  end
end
