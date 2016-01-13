require 'rails_helper'

RSpec.describe Item, type: :model do
  it "creates an item" do
    item = Item.create

    expect(Item.all.count).to eq(1)
  end
end
