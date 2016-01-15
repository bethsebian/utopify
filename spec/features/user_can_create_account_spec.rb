require 'rails_helper'

RSpec.feature "user can create account from home" do
  scenario "I see my dashboard" do

    visit '/'

    expect(page).to have_content("Login")

    click_link "Create Account"

    fill_in "First Name:", with: "Jordan"
    fill_in "Last Name:", with: "Lawler"
    fill_in "Username:", with: "jlawlz"
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation", with: "password"
    within "#new_user_submit" do
      click_on "Create Account"
    end

    user = User.find_by(username: 'jlawlz')

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Logged in as Jordan"
    expect(page).to_not have_content "Login"
    expect(page).to have_content "Logout"
  end
end
