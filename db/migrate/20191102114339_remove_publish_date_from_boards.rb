class RemovePublishDateFromBoards < ActiveRecord::Migration[5.0]
  def change
    remove_column :boards, :ppublish_date, :date
  end
end
