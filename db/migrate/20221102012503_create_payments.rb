class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :card_number
      t.integer :exp_date
      t.integer :cvv

      t.timestamps
    end
  end
end
