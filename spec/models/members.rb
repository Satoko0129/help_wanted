require 'rails_helper'

RSpec.describe 'Memberモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { member.valid? }

    let!(:other_member) { create(:member) }
    let(:member) { build(:member) }

    context 'nicknameカラム' do
      it '空欄でないこと' do
        member.nickname = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        member.nickname = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        member.nickname = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '15文字以下であること: 15文字は〇' do
        member.nickname = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '15文字以下であること: 16文字は×' do
        member.nickname = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
      it '一意性があること' do
        member.nickname = other_member.nickname
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Questモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:quests).macro).to eq :has_many
      end
    end
  end
end
