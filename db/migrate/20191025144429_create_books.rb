class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|

      t.timestamps
      
      t.string :name
      t.integer :isbn_num
      t.string :images
      t.string :edition
      t.string :author
      t.string :category
      t.string :condition
      t.integer :rental_price
      
    
    end
  end
end
