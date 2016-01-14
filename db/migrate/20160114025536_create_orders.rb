class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.references :user, index: true, foreign_key: true
      t.string :total_price

      t.timestamps null: false
    end
  end
end
