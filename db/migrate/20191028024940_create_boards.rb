class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|

      t.timestamps
      t.integer :book_id
      t.text :remarks
      t.string :images
      t.string :condition
      t.date :available_period
    end
  end
end
