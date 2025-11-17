class CreateProperties < ActiveRecord::Migration[8.1]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :address
      t.string :property_type
      t.decimal :purchase_price
      t.date :purchase_date

      t.timestamps
    end
  end
end
