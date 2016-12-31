require 'rails_helper'

RSpec.feature "user visits dashboard page" do
  scenario "user clicks to edit personal info and edits their info properly" do
    user = create(:user)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.first_name}")
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.username)

    click_on "Edit Info"
    expect(current_path).to eq(edit_user_path(user))

    fill_in "First Name", with: "newfirstname"
    fill_in "Last Name", with: "newlastname"
    fill_in "Username", with: "newusertname"
    fill_in "Password", with: "newpassword"
    click_on "Submit"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("newfirstname")
    expect(page).to have_content("newlastname")
    expect(page).to have_content("newusertname")
  end

  scenario "user clicks button to edit personal info but fills in improper info and sees an error message" do
    user = create(:user)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.first_name}")
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.username)

    click_on "Edit Info"
    expect(current_path).to eq(edit_user_path(user))

    fill_in "First Name", with: nil
    fill_in "Last Name", with: nil
    fill_in "Username", with: nil
    fill_in "Password", with: nil
    click_on "Submit"

    expect(current_path).to eq(edit_user_path(user))
  end
end
