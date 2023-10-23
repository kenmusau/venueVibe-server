class RemoveClientIdFromSpaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :spaces, :client_id, :integer
  end
end
