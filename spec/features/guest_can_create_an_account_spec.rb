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

	scenario "account creation fails without name" do
		visit root_path
    click_on "Create Account"
    expect(current_path).to eq("/users/new")

    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "Username", with: "jennyj"
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation:", with: "password"
    click_on "Create"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end

	scenario "account creation fails without unique username" do
		value = "pete"
		user = create(:user, username: value)
		visit root_path
    click_on "Create Account"
    expect(current_path).to eq("/users/new")

    fill_in "First Name", with: "john"
    fill_in "Last Name", with: "doe"
    fill_in "Username", with: value
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation:", with: "password"
    click_on "Create"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("#{value} is already taken. Please choose a different username")
  end

end
