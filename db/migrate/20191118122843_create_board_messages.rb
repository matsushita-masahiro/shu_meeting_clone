class CreateBoardMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :board_messages do |t|
      t.integer :board_id
      t.integer :user_id
      t.text :content
      t.timestamps
    end
  end
end
