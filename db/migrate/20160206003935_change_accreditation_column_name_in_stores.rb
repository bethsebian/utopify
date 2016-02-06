class ChangeAccreditationColumnNameInStores < ActiveRecord::Migration
  def change
    add_column :stores, :accreditations, :text, array: true, default: []
    remove_column :stores, :accreditation
  end
end
