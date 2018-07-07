class AddCategoryToPaids < ActiveRecord::Migration[5.2]
  def change
    add_column :paids, :category, :string
  end
end
