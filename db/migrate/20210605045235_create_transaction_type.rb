class CreateTransactionType < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_types do |t|

      t.timestamps
    end
  end
end
