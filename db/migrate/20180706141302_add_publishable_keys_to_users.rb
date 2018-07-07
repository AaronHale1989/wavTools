class AddPublishableKeysToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :publishable_key, :string
    add_column :users, :secret_key, :string
    add_column :users, :stripe_user_id, :string
    add_column :users, :stripe_account_type, :string
  end
end
