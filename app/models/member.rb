class Member < ApplicationRecord
  has_many :quests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: %i[nickname]


  validates :nickname, uniqueness: true, presence: true, length: { maximum: 20 }
#  validates :birthday, presence: true

  def email_required?
    false
  end
  def email_changed?
    false
  end

end
