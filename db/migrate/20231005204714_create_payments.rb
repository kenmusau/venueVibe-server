class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.references :booking, null: false, foreign_key: true
      t.datetime :payment_date
      t.boolean :status

      t.timestamps
    end
  end
end
