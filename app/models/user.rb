class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    
    has_many :authored_deposits, foreign_key: :author_id, class_name: 'Deposit', dependent: :destroy
    has_many :groups, dependent: :destroy

    validates :name, presence: true, length: { minimum: 2 }
    validates :email, presence: true
    validates :password, length: { in: 4..20 }

    def grouped
      authored_deposits.joins(:grouped_payments)
        .order('name DESC')
        .where('grouped_payments.group_id >= 1')
        .group('deposits.id')
    end

    def ungrouped
      authored_deposits.includes(:grouped_payments).order('name DESC').map do |deposit|
        deposit if deposit.grouped_payments.empty?
      end.compact
    end
end
