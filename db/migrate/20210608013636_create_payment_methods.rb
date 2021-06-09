class CreatePaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_methods do |t|
      t.string :type
      t.decimal :fee
      t.decimal :max_money_fee
      t.integer :state

      t.timestamps
    end
  end
end
