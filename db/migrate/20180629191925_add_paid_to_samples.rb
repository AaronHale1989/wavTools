class AddPaidToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :payment, :string
  end
end
