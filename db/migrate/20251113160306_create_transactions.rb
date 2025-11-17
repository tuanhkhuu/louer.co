class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.references :property, null: false, foreign_key: true
      t.string :transaction_type
      t.string :category
      t.decimal :amount
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
