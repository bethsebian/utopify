require 'rails_helper'

RSpec.feature "user adds items to cart" do
  scenario "completes an order" do
    user = create(:user)
    item_1 = create(:category_with_items, items_count: 1).items.first
    store = create(:store)
    item_1.store = store
    item_1.save

    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit root_path

    within "div.item_#{item_1.id}" do
      click_button('Add To Cart')
    end

    click_on "My Cart"

    expect(current_path).to eq '/cart'

    click_on "Checkout"

    expect(page).to have_content "Order was successfully placed."
    expect(current_path).to eq "/dashboard"
  end
end
