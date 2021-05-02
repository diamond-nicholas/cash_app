class CreateDeposits < ActiveRecord::Migration[6.1]
  def change
    create_table :deposits do |t|
      t.string :name
      t.integer :amount
      t.references :author, null: false

      t.timestamps
    end
  end
end
