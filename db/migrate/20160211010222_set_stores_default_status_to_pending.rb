class SetStoresDefaultStatusToPending < ActiveRecord::Migration
  def change
    change_column_default(:stores, :status, 'pending')
  end
end
