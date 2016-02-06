require 'rails_helper'

RSpec.describe Category, type: :model do
  it "adjusts slug" do
    category = Category.create(title: "Natural Disaster")

    expect(category.slug).to eq("natural-disaster")
  end
end
