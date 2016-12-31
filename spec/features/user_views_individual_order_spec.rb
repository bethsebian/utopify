require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.feature "user visits dashboard page" do
  scenario "user sees thier orders in the orders table" do
    user = create(:user)
    store= create(:store)
    item_1 = create(:item, store_id: store.id)
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
    expect(current_path).to eq(order_path(order_1))
    expect(page).to have_content(number_to_currency(order_1.total_price))
    expect(page).to have_content(order_item_1.item_quantity)
    expect(page).to have_content(order_1.status.capitalize)
    expect(page).to have_content(order_1.created_at.strftime("%B %e, %Y"))

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(number_to_currency(order_item_1.item_price))
    expect(page).to have_content(number_to_currency(order_item_1.item_price * order_item_1.item_quantity))
  end
end

# As a user,
# with 1 order with 1 item,
# when I go to my dashboard,
# within the orders section,
# I click on my order number,
# I am redirected to my order page,
# and the path is ‘/orders/id’
# and I see my order created_at date,
# and I see my order status,
# and I see item 1’s title,
# and I see item 1’s cost,
# and I see item 1’s line cost, ??????????????
# and I see the order total,
# and I see a link to return to my dashboard.
