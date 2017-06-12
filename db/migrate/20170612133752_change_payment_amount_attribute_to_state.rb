class ChangePaymentAmountAttributeToState < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :amount, :decimal, precision: 15, scale: 2, null: false, default: 0.00, comment: 'Сумма платежа'
    add_column :payments, :overdued, :boolean, null: false, default: false, comment: 'Статус платежа'
  end
end
