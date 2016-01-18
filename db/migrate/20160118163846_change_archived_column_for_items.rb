class ChangeArchivedColumnForItems < ActiveRecord::Migration
  def change
    add_column :items, :active, :boolean, default: true
    remove_column :items, :archived
  end
end

