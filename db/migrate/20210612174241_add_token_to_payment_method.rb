class AddTokenToPaymentMethod < ActiveRecord::Migration[6.1]
  def change
    add_column :payment_methods, :token, :string
  end
end
