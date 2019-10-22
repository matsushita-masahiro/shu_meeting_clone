class ChangeDatatypePostcodeOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :postcode, :integer
  end
end
