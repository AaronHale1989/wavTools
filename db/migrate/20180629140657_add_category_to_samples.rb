class AddCategoryToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :category, :string
  end
end
