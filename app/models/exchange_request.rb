class ExchangeRequest < ApplicationRecord
  belongs_to :member

  # 0: 申請中 / 1: 許可 / 2: 却下
  enum appoval_flag: {applying: 0, permission: 1, rejected: 2}
end
