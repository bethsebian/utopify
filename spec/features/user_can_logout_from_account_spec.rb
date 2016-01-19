require 'rails_helper'

RSpec.feature "user can logout account from navbar" do
  scenario "I see home page" do

    User.create(
                first_name: "Jordan",
                last_name: "Lawler",
                username: "jlawlz",
                password: "password"
                )

    visit '/'

    click_link "Login"

    expect(current_path).to eq login_path

    fill_in "Username", with: "jlawlz"
    fill_in "Password", with: "password"

    click_button "Sign In"

    user = User.find_by(username: 'jlawlz')

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Logged in as Jordan"
    expect(page).to_not have_content "Login"

    click_link "Logout"

    expect(current_path).to eq '/'
    expect(page).to have_content "Login"
    expect(page).to_not have_content "Logout"
  end
end
