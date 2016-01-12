class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :image_url

      t.timestamps null: false
    end
  end
end
