class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :owner_name
      t.string :type
      t.decimal :balance

      t.timestamps
    end
  end
end
