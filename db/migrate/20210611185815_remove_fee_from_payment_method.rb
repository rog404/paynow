class RemoveFeeFromPaymentMethod < ActiveRecord::Migration[6.1]
  def change
    remove_column :payment_methods, :fee, :decimal
  end
end
