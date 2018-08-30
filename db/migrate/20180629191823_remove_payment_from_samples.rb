class RemovePaymentFromSamples < ActiveRecord::Migration[5.2]
  def change
    remove_column :samples, :payment, :boolean
  end
end
