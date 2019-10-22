class RenameCityColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :city, :address_city
  end
end
