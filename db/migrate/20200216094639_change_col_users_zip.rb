class ChangeColUsersZip < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :zip
    add_column :users, :postcode, :integer
  end
end
