class Deposit < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :grouped_payments, foreign_key: :deposit_id
  has_many :groups, through: :grouped_payments

  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true

  def grouped_payment_find(group)
    grouped_payments.find_by(group_id: group.id)
  end
end
