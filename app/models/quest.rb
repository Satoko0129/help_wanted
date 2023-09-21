class Quest < ApplicationRecord
   with_options presence: true, on: :publicize do
    validates :name
    validates :level
    validates :price
    validates :introduction
  end
  validates :name, length: { maximum: 14 }, on: :publicize
  validates :introduction, length: { maximum: 80 }, on: :publicize

  enum level: { easy: 0, normal: 1, hard: 2 }
end
