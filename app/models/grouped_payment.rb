class GroupedPayment < ApplicationRecord
  belongs_to :deposit
  belongs_to :group
end
