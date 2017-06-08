class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, comment: 'Таблица заёмщиков' do |t|
      t.string :name, null: false, comment: 'Имя заёмщика'

      t.timestamps
    end
  end
end
