class AddSponsorsToTravesty < ActiveRecord::Migration
  def change
    add_column :travesties, :sponsor_image, :string
    add_column :travesties, :sponsor_title, :string
  end
end
