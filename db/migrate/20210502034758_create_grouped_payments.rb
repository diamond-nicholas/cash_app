class CreateGroupedPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :grouped_payments do |t|
      t.references :deposit, null: false
      t.references :group, null: false

      t.timestamps
    end
  end
end
