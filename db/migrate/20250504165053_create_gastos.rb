class CreateGastos < ActiveRecord::Migration[7.1]
  def change
    create_table :gastos do |t|
      t.string :description
      t.decimal :value
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
