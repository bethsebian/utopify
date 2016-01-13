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
    item_1 = Item.create
    item_2 = Item.create

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

  it "sums line total prices for each item in cart" do
    cart = Cart.new(nil)
    item = Item.create(price: 20)
    cart.add_item(item.id)

    expect(cart.line_total_price(item)).to eq(20)

    cart.add_item(item.id)
    expect(cart.line_total_price(item)).to eq(40)
  end

  it "sums total price all items in cart" do
    cart = Cart.new(nil)
    item_1 = Item.create(price: 20)
    item_2 = Item.create(price: 30)
    cart.add_item(item_1.id)
    cart.add_item(item_1.id)
    cart.add_item(item_2.id)

    expect(cart.total_price).to eq(70)
  end
end