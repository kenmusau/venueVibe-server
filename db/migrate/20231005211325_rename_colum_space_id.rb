class RenameColumSpaceId < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :spaces_id, :space_id
  end
end
