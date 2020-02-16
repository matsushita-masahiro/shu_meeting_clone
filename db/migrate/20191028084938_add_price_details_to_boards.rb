class AddPriceDetailsToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :decide_price, :integer
  end
end
