class DropItemsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :items
  end

  def down
   fail ActiveRecord::IrreversibleMigration
 end
end
