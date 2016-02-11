require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.feature 'guest registers as user' do
	scenario 'and is redirected to user dash' do

    visit root_path

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    fill_in :first_name, with: "john"
    fill_in :last_name, with: "doe"
    fill_in :user_name, with: "johnnyd"
    fill_in :password, with: "password"
    fill_in :password_confirmation, with: "password"
    click_on "Create"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("john")


  end
end

# As a guest,
# when I am on the homepage,
# and I click on “Create Account”,
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
