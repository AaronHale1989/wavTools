class AddStripeAccountTypeToPaids < ActiveRecord::Migration[5.2]
  def change
    add_column :paids, :stripe_account_type, :string
  end
end
