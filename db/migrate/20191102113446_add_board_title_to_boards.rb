class AddBoardTitleToBoards < ActiveRecord::Migration[5.0]
  def up
    add_column :boards, :title, :string
  end
  def down
    remove_column :boards, :ppublish_date, :date
  end
end
