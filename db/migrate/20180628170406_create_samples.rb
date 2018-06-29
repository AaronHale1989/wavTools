class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.string :title
      t.string :audio
      t.integer :user_id

      t.timestamps
    end
  end
end
