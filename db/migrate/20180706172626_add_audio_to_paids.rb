class AddAudioToPaids < ActiveRecord::Migration[5.2]
  def change
    add_column :paids, :audio, :string
  end
end
