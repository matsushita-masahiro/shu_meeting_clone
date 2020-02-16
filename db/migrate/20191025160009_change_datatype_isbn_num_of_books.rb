class ChangeDatatypeIsbnNumOfBooks < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :isbn_num, :bigint
  end
end
