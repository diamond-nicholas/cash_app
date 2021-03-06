class Group < ApplicationRecord
  belongs_to :user
  has_many :grouped_payments, foreign_key: :group_id
  has_many :deposits, through: :grouped_payments

  validates :name, presence: true, length: { minimum: 2 }
  validates :icon, presence: true
end
