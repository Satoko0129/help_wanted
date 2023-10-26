class CreateQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :quests do |t|
      t.integer :member_id
      t.integer :admin_id
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :price, null: false
      t.integer :level, default: 0, null: false
      t.string :time, null: false
      t.integer :status, default: 0, null: false
      t.boolean :is_draft,  default: false, null: false


      t.timestamps null: false
    end
  end
end
