class CreatePixCompanions < ActiveRecord::Migration[6.1]
  def change
    create_table :pix_companions do |t|
      t.string :key
      t.string :bank_code
      t.integer :pix_id

      t.timestamps
    end
  end
end
