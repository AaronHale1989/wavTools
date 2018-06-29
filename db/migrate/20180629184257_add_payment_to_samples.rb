class AddPaymentToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :payment, :boolean
  end
end
