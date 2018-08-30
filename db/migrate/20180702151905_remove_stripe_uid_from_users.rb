class RemoveStripeUidFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :stripe_uid, :string
  end
end
