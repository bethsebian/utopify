class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
