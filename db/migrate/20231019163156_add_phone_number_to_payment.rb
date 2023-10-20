class AddPhoneNumberToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :phone_number, :integer
  end
end
