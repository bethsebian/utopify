require 'rails_helper'

RSpec.feature "user can view past orders" do
  scenario "sees index of orders" do

    db_repo = FactoryJordan.new
    user = db_repo.create_users(1)[0]

    visit '/'

    click_link "Login"

    expect(current_path).to eq login_path

    fill_in "Username", with: "jlawlz"
    fill_in "Password", with: "password"

    click_button "Submit"

    user = User.find_by(username: 'jlawlz')

    order = Order.create(status: "Paid",
                         total_price: 12,
                         user_id: user.id)

    visit orders_path

    expect(current_path).to eq orders_path

    expect(page).to have_content "12"
    expect(page).to have_content "Paid"
  end
end
