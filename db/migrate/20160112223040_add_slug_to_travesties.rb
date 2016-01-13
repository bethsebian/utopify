class AddSlugToTravesties < ActiveRecord::Migration

  def change
    add_column :travesties, :slug, :string
  end

end
