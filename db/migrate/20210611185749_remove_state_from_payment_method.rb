class RemoveStateFromPaymentMethod < ActiveRecord::Migration[6.1]
  def change
    remove_column :payment_methods, :state, :integer
  end
end
