class ChangeDatatypePrefectureCodeOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :prefecture_code, :integer
  end
end
