class CreatePaids < ActiveRecord::Migration[5.2]
  def change
    create_table :paids do |t|
      t.integer :user_id
      t.integer :price
      t.string :description
      t.timestamps
    end
  end
end
