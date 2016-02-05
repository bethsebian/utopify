class UpdateForeignKeyInItems < ActiveRecord::Migration
  def change
    remove_reference :items, :travesty, index: true, foreign_key: true
    add_reference :items, :category, index: true, foreign_key: true
  end
end
