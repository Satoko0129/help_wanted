class CreateExchangeRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :exchange_requests do |t|
      t.integer :member_id, null: false
      t.integer :request_amount, null: false
      t.integer :appoval_flag, default: 0

      t.timestamps null: false
    end
  end
end
