class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :type
      t.string :description
      t.decimal :fee
      t.decimal :max_money_fee
      t.integer :state

      t.timestamps
    end
  end
end
