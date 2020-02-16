class AddUseridBoardidToFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table  :favorites do |t|
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true
      t.index [:user_id, :board_id], unique: true
    end
  end
end
