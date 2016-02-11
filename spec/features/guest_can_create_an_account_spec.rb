# As a guest,
# when I am on the homepage,
# and I click on “Sign Up”,
# I am directed to the new user page,
# and the path is ‘/users/new’
# and I fill in my first name with ‘’,
# and I fill in my last name with ‘’,
# and I fill in my username name with ‘’,
# and I fill in my password name with ‘’,
# and I fill in my password confirmation name with ‘’,
# and I click on Submit,
# I am directed to my User dashboard,
# and I see my name,
# and I see how long I’ve been a user,
# and I see a link in the navbar to “Sign Out”

require 'rails_helper'

RSpec.feature "guest visits home page" do
	scenario "clicks link to create account" do
    visit root_path
    click_on "Create Account"
    expect(current_path).to eq("/users/new")

    fill_in "First Name", with: "Jenny"
    fill_in "Last Name", with: "Jennerson"
    fill_in "Username", with: "jennyj"
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation:", with: "password"
    click_on "Create"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Jenny")
    expect(page).to have_content("Logout")
  end
end
