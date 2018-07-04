class RemovePublishableKeyFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :publishable_key, :string
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :access_code, :string
  end
end
