class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :source
      t.integer :target
      t.float :amount
      t.string :reason

      t.timestamps
    end
  end
end
