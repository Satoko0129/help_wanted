class Quest < ApplicationRecord
  has_one :wallet
  belongs_to :member, optional: true
  has_one_attached :quest_image

  def get_image(width, height)
    unless quest_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      quest_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    quest_image.variant(resize_to_fill: [width, height]).processed
  end

  with_options presence: true, on: :publicize do
    validates :name
    validates :level
    validates :price
    validates :introduction
  end
  validates :name, length: { maximum: 14 }, on: :publicize
  validates :introduction, length: { maximum: 80 }, on: :publicize

  enum level: { easy: 0, normal: 1, hard: 2 }
  enum status: { recruitment: 0, close: 1, complete: 2 } # TODO: どこかで齟齬がでたらcomplete = 3になっていないか確認
end
