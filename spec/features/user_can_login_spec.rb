# As a user,
# When I’m on the homepage,
# and when I click on login,
# I am on the login page,
# and when I enter my username and password and click submit,
# I am redirected to my dashboard.
require 'rails_helper'

RSpec.feature "guest visits home page and clicks on the login button" do
  scenario "user fills in proper info and is routed to their dashboard" do
    user = create(:user)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.first_name}")
  end

  scenario "user fills in improper info `and sees an error message" do
    user = create(:user)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "this is a wrong password"
    click_on "Sign In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Username or password incorrect.")

  end

end
