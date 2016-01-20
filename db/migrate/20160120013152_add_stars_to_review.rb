class AddStarsToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :stars, :integer, default: 1
  end
end
