class AddPriceToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_fee, :decimal
    add_column :orders, :discount, :decimal
    add_column :orders, :total_price, :decimal
  end
end
