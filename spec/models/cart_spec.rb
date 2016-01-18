require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "starts with no contents" do
    cart = Cart.new(nil)
    count = cart.contents.count

    expect(count).to eq(0)
  end

  it "adds new item to cart" do
    cart = Cart.new(nil)
    item = Item.new

    add_one = cart.add_item(item.id)
    count = cart.contents.count

    expect(count).to eq(1)
  end

  it "increases count of single item in cart" do
    cart = Cart.new(nil)
    item = Item.new

    cart.add_item(item.id)
    count = cart.contents.values.last

    expect(count).to eq(1)

    cart.add_item(item.id)
    count = cart.contents.values.last

    expect(count).to eq(2)
  end

  it "adds second item to cart" do
    cart = Cart.new(nil)
    item_1 = Item.create(title: "title",
                         description: "description",
                         price: 10)
    item_2 = Item.create(title: "title_2",
                         description: "description",
                         price: 10)

    cart.add_item(item_1.id)
    count = cart.contents.count

    expect(count).to eq(1)

    cart.add_item(item_2.id)
    count = cart.contents.count

    expect(count).to eq(2)
  end

  it "counts total unique items in cart" do
    cart = Cart.new(nil)
    item_1 = Item.create
    item_2 = Item.create

    cart.add_item(item_1.id)
    cart.add_item(item_2.id)

    expect(cart.count_of).to eq(2)
  end

  it "sums total price all items in cart" do
    cart = Cart.new(nil)

    travesty = create(:travesty_with_items)

    item_1, item_2 = travesty.items[0..1]

    cart.add_item(item_1.id)
    cart.add_item(item_1.id)
    cart.add_item(item_2.id)

    expect(cart.total_price).to eq((item_1.price * 2) + (item_2.price))
  end
end
