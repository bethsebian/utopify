require 'rails_helper'


RSpec.feature "user can login from home" do
  scenario "I see my dashboard" do

    visit '/'

    expect(page).to have_content("Login")

    click_link "Create Account"

    fill_in "Name:", with: "Jordan"
    fill_in "Username:", with: "jlawlz"
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Create Account"

    user = User.find_by(username: 'jlawlz')

    expect(current_path).to eq dashboard_path(user)

    expect(page).to have_content "Logged in as Jordan"
    expect(page).to_not have_content "Login"
    expect(page).to have_content "Logout"
  end
end

# As a visitor
#     When I visit "/"
#     Then I should see a link for "Login"
#     And when I click link "Create Account"
#     Then my current page should be "/dashboard"
#     And I should see a message in the navbar that says "Logged in as SOME_USER"
#     And I should see my profile information
#     And I should not see a link for "Login"
#     And I should see a link for "Logout"
#
# And when I visit "/cart"
# Then I should see all of the data that was there when I was not logged in
# When I click "Logout"
# Then I should see see "Login"
# And I should not see "Logout"
