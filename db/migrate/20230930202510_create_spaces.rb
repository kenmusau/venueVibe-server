class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :location
      t.integer :price
      t.boolean :status
      t.string :image
      t.text :description
      t.integer :contact
      t.belongs_to :admin, null: false, foreign_key: true
      t.belongs_to :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
