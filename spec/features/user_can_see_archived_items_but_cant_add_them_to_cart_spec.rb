require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.feature "user visits dashboard page" do
  scenario "and cannot add inactive item to cart" do
    user = create(:user)
    store= create(:store)
    category_1 = create(:category)
    item_1 = create(:item, store_id: store.id, category_id: category_1.id)
    order_1 = create(:order, user_id: user.id, status: "ordered")
    order_item_1 = create(:order_item, order_id: order_1.id, item_id: item_1.id, item_price: item_1.price)
    order_1.total_price = order_item_1.item_price * order_item_1.item_quantity
    order_1.save

    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_on "Sign In"
    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(number_to_currency(order_1.total_price))
    expect(page).to have_content(order_1.created_at.strftime("%B %e, %Y"))
    expect(page).to have_content(order_1.id)

    within("#user-orders-table") do
      click_on 'view'
    end

    click_on "#{order_item_1.item.title}"

    item_1.active = false
    item_1.save

    expect(page).to have_content("My Cart: 0")
    
    click_on("Add To Cart")

    expect(page).to have_content("My Cart: 0")
  end

  scenario "and can add active item to cart" do
    user = create(:user)
    store= create(:store)
    category_1 = create(:category)
    item_1 = create(:item, store_id: store.id, category_id: category_1.id)
    order_1 = create(:order, user_id: user.id, status: "ordered")
    order_item_1 = create(:order_item, order_id: order_1.id, item_id: item_1.id, item_price: item_1.price)
    order_1.total_price = order_item_1.item_price * order_item_1.item_quantity
    order_1.save

    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_on "Sign In"
    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(number_to_currency(order_1.total_price))
    expect(page).to have_content(order_1.created_at.strftime("%B %e, %Y"))
    expect(page).to have_content(order_1.id)

    within("#user-orders-table") do
      click_on 'view'
    end

    click_on "#{order_item_1.item.title}"

    expect(page).to have_content("My Cart: 0")

    click_on("Add To Cart")

    expect(page).to have_content("My Cart: 1")
  end
end

# As a registered user,
# When i visit my order history
# Then I can see inactive/archived items
# but I can not add them to cart
