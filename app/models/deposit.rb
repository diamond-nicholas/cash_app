class Deposit < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :grouped_payments, foreign_key: :deposit_id
  has_many :groups, through: :grouped_payments

end
