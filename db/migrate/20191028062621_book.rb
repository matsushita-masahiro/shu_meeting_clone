class Book < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :normal_price, :integer
    add_column :books, :publisher, :string
  end
end
