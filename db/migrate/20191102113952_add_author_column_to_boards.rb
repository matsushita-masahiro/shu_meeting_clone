class AddAuthorColumnToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :author, :string 
  end
end
