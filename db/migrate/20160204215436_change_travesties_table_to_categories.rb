class ChangeTravestiesTableToCategories < ActiveRecord::Migration
  def change
    rename_table :travesties, :categories
  end
end
