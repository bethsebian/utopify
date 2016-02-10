class RemoveCosbyFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :image_url, :string
    add_column :items, :image_url, :string
  end
end
