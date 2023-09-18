class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :quest_id, null: false
      t.integer :star, default: 2, null: false
      t.text :comment, null: false

      t.timestamps null: false
    end
  end
end
