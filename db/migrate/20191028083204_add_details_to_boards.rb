class AddDetailsToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :book_name, :string
    add_column :boards, :isbn_num, :bigint
    add_column :boards, :category, :string
  end
end
