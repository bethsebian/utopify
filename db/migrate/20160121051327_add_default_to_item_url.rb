class AddDefaultToItemUrl < ActiveRecord::Migration
  def change
    change_column :items, :image_url, :string, :default => "bill_cosby.gif"
  end
end
