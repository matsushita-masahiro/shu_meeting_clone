class ChangeColumnUsersPrefecture < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :prefecture
    add_column :users, :prefecture_code, :integer
  end
end
