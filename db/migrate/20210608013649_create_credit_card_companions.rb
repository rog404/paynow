class CreateCreditCardCompanions < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_card_companions do |t|
      t.string :code
      t.integer :credit_card_id

      t.timestamps
    end
  end
end
