class Member < ApplicationRecord
  has_many :quests
  has_many :exchange_requests
  has_many :wallets
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

  def self.guest
    find_or_create_by!(is_guest: true) do |member|
      member.password = SecureRandom.urlsafe_base64
      member.nickname = 'ゲスト'
      member.birthday = '2023-01-01'
    end
  end

end
