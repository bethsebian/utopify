require 'rails_helper'

RSpec.describe Category, type: :model do
  it "adjusts slug" do
    category = Category.create(title: "Natural Disaster Relief")

    expect(category.slug).to eq("natural-disaster-reflief")
  end
end
