class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :profile_picture

      t.timestamps
    end
  end
end
