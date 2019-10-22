class RenameZipColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :zip, :postcode
  end
end
