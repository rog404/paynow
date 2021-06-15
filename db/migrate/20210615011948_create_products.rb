class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :token
      t.string :name
      t.decimal :price
      t.decimal :discount_pix
      t.decimal :discount_boleto
      t.decimal :discount_credit_card
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
