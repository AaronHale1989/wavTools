class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string   "title"
      t.string   "description"
      t.integer  "price"
      t.integer  "merchant_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.index ["merchant_id"], name: "index_items_on_merchant_id", using: :btree
    end
  end
end
