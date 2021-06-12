class RemoveMaxMoneyFeeFromPaymentMethod < ActiveRecord::Migration[6.1]
  def change
    remove_column :payment_methods, :max_money_fee, :decimal
  end
end
