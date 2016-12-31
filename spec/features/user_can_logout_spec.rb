require 'rails_helper'

RSpec.feature "logged in user clicks on the logout button" do
  scenario "is routed to the root page" do
    user = create(:user)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.first_name}")

    expect(page).to_not have_content("Login")

    click_on('Logout')

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
  end

end
