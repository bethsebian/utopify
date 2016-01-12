class AddTravestyRefToItems < ActiveRecord::Migration
  def change
    add_reference :items, :travesty, index: true, foreign_key: true
  end
end
