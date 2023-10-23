class RemoveClientIdFromSpaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :Spaces, :client_id, :integer
  end
end
