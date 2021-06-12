class RemoveDescriptionFromPaymentMethod < ActiveRecord::Migration[6.1]
  def change
    remove_column :payment_methods, :description, :string
  end
end
