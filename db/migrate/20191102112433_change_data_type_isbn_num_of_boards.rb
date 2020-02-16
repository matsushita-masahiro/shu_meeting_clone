class ChangeDataTypeIsbnNumOfBoards < ActiveRecord::Migration[5.0]
  def change
    change_column :boards, :isbn_num, :bigint
  end
end
