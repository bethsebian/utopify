class RemoveItemIdFromStores < ActiveRecord::Migration
  def change
    remove_reference :stores, :item, index: true, foreign_key: true
  end
end
