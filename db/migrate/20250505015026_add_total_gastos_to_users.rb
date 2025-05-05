class AddTotalGastosToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :total_gastos, :float, default: 0.0
  end
end
