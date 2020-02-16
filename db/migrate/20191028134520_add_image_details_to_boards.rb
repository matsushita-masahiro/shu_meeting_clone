class AddImageDetailsToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :ppublish_date, :date
  end
end
