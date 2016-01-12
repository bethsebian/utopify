class CreateTravesties < ActiveRecord::Migration
  def change
    create_table :travesties do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
