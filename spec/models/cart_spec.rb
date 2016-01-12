require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "starts with no contents" do
    cart = Cart.new

    assert_equal 0, cart.contents
  end


  it "adds new item to cart" do
    @contents
  end

  xit "increases count of item in cart" do

  end

  xit "adds second item to cart" do

  end

  xit "counts total unique items in cart" do

  end

  xit "sums count of all unique items in cart" do

  end

  xit "sums line total prices for each item in cart" do

  end

  xit "sums total price all items in cart" do

  end
end
