require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.feature "user visits dashboard page" do
  scenario "user sees thier orders in the orders table" do
    user = create(:user)
    order_1 = create(:order, user_id: user.id, status: "pending")
    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_on "Sign In"
    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(number_to_currency(order_1.total_price))
    expect(page).to have_content(order_1.created_at.strftime("%B %e, %Y"))
    expect(page).to have_content(order_1.id)
  end
end

# As a user,
# with 1 order,
# when I go to my dashboard,
# within the orders section,
# I see my order created_at time,
# and I see my order amount.
