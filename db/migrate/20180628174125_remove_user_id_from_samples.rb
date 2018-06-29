class RemoveUserIdFromSamples < ActiveRecord::Migration[5.2]
  def change
    remove_column :samples, :user_id, :integer
  end
end
