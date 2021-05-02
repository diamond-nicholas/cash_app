class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  has_many :authored_deposits, foreign_key: :author_id, class_name: 'Deposit', dependent: :destroy
  has_many :groups, dependent: :destroy
end
