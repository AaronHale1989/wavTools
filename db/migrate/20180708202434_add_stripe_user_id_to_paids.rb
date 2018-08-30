class AddStripeUserIdToPaids < ActiveRecord::Migration[5.2]
  def change
    add_column :paids, :stripe_user_id, :string
  end
end
