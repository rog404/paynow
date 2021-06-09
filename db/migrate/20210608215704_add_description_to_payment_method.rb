class AddDescriptionToPaymentMethod < ActiveRecord::Migration[6.1]
  def change
    add_column :payment_methods, :description, :string
  end
end
