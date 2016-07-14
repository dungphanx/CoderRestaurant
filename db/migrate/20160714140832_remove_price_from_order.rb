class RemovePriceFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :delivery_fee, :decimal
    remove_column :orders, :discount, :decimal
    remove_column :orders, :total_price, :quantity
  end
end
