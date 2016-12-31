class ChangeTotalPriceTypeInOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :total_price, :string
    add_column :orders, :total_price, :integer
  end
end
