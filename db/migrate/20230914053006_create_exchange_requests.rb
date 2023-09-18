class CreateExchangeRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :exchange_requests do |t|
      t.integer :request_amount, null: false
      t.boolean :appoval_flag, default: false, null: false

      t.timestamps null: false
    end
  end
end
