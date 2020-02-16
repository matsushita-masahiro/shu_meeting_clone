class RemoveUseridBoardidFromFavorites < ActiveRecord::Migration[5.0]
  def change
    remove_column :favorites, :user_id, :integer
    remove_column :favorites, :board_id, :integer
  end
end
