class CreateBoletoCompanions < ActiveRecord::Migration[6.1]
  def change
    create_table :boleto_companions do |t|
      t.string :bank_code
      t.string :bank_agency
      t.string :bank_account
      t.integer :boleto_id

      t.timestamps
    end
  end
end
