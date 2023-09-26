class Wallet < ApplicationRecord
  belongs_to :member
  belongs_to :quest
end
