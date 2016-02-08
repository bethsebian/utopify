class ChangeUserIdInStoresToReference < ActiveRecord::Migration
  def change
    remove_column :stores, :user_id
    add_reference :stores, :user, index: true, foreign_key: true
  end
end
