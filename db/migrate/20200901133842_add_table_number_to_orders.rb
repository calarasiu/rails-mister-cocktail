class AddTableNumberToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :table_number, :string
  end
end
