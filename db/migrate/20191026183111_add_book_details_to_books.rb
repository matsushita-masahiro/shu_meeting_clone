class AddBookDetailsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :book_details, :text
  end
end
