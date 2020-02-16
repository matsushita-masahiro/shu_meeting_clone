class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :inquiry_id
      t.text :answer

      t.timestamps
    end
  end
end
