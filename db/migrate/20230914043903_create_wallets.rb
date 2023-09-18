class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.integer :member_id, null: false
      t.integer :remaining_money, null: false

      t.timestamps null: false
    end
  end
end
