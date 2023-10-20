class AddBookingIdToMpesas < ActiveRecord::Migration[7.0]
  def change
    add_reference :mpesas, :booking, foreign_key: true
  end
end
