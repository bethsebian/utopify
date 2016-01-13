require 'rails_helper'

RSpec.feature "visitor can remove items from cart" do
  scenario "cart shows no items in cart after removal" do

    db_repo = FactoryJordan.new
    db_repo.create_travesty("Environmental Disasters")

    visit '/items'

    first(:button, 'Add to cart').click

    expect(page).to have_content("My Cart: 1")
    expect(page).to have_content("You have 1 item in your cart.")

    visit '/cart'

    first(:link, "Remove").click

    expect(current_path).to eq(cart_path)
    find_link('Oil Barrel Dump').visible?
    expect(page).to have_content("Successfully removed Oil Barrel Dump from your cart.")
    expect(page).to have_css(".flash_green_card")
    expect(page).to_not have_content("My Cart: 1")
    expect(page).to have_content("My Cart: 0")
  end
end
