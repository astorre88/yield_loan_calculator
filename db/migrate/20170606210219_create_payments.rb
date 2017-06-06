class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments, comment: 'Таблица платежей' do |t|
      t.decimal :amount, precision: 15, scale: 2, null: false, default: 0.00, comment: 'Сумма платежа'
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
