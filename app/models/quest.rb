class Quest < ApplicationRecord
   with_options presence: true, on: :publicize do
    validates :price
    validates :level
    validates :title
    validates :introduction
    validates :introduction
  end
  validates :title, length: { maximum: 14 }, on: :publicize
  validates :introduction, length: { maximum: 80 }, on: :publicize

  enum star: { easy: 0, normal: 1, hard: 2 }
end
