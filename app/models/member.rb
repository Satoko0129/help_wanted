class Member < ApplicationRecord
  has_many :quests
  has_many :exchange_requests
  has_many :wallets
  belongs_to :admin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: %i[nickname]


  validates :nickname, uniqueness: true, presence: true, length: { maximum: 20 }
#  validates :birthday, presence: true

  before_validation :set_admin_id

  def email_required?
    false
  end
  
  def email_changed?
    false
  end

  def self.guest
    find_or_create_by!(is_guest: true) do |member|
      member.admin_id = Admin.guest.id
      member.password = SecureRandom.urlsafe_base64
      member.nickname = 'ゲスト'
      member.birthday = '2023-01-01'
    end
  end

  private
  
  def set_admin_id
    admin = Admin.find_by(invitation_code: self.admin_invitation_code)
    self.admin_id = admin.id if admin && self.new_record?
  end
end
