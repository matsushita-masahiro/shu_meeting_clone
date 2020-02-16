class AddDetailsToFavorites < ActiveRecord::Migration[5.0]
  def change
    add_reference :favorites, :user, foreign_key: true
    add_reference :favorites, :board, foreign_key: true
  end
end
