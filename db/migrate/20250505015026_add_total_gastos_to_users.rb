class AddTotalGastosToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :total_gastos, :float
  end
end
