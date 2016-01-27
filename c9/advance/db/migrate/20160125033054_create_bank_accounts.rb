class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :amount
      t.string :currency

      t.timestamps null: false
    end
  end
end
