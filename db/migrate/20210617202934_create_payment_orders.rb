class CreatePaymentOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_orders do |t|
      t.string :token
      t.string :company_token
      t.string :payment_method_token
      t.string :product_token
      t.string :client_token
      t.decimal :value
      t.decimal :discount_value
      t.integer :status

      t.timestamps
    end
  end
end
