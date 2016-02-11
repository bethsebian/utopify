require 'rails_helper'

RSpec.feature "user loggs in" do
  scenario "clicks a link to go to their dashboard" do
		user = create(:user)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.first_name}")

		expect(page).to have_content("My Dashboard")
		click_on("My Dashboard")
		expect(current_path).to eq(dashboard_path)
  end
end
