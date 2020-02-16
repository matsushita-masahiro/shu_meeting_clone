class RenameBookIdColumnToBoards < ActiveRecord::Migration[5.0]
  def change
    rename_column :boards, :book_id, :user_id
  end
end
