class Admin < ApplicationRecord
  has_many :members
  has_many :quests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   before_create :set_invitation_code

  def self.guest
    find_or_create_by!(email: 'admin.guest@example.com') do |admin|
      admin.password = 123456
    end
  end

  private
  def set_invitation_code
    while self.invitation_code.blank? || Admin.find_by(invitation_code: self.invitation_code).present? do
      self.invitation_code = 6.times.map { rand(9) }.join
    end
  end
end
