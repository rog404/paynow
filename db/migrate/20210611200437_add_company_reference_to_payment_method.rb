class AddCompanyReferenceToPaymentMethod < ActiveRecord::Migration[6.1]
  def change
    add_reference :payment_methods, :company, null: false, foreign_key: true
  end
end
