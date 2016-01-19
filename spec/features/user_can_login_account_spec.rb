require 'rails_helper'

RSpec.feature "user can login account from home" do
  scenario "I see my dashboard" do

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

    click_button "Submit"

    user = User.find_by(username: 'jlawlz')

    expect(current_path).to eq dashboard_path

    expect(page).to have_content "Logged in as Jordan"
    expect(page).to_not have_content "Login"
    expect(page).to have_content "Logout"
  end

  scenario "I get redirected if my credentials are not correct" do
    User.create(
                first_name: "Jordan",
                last_name: "Lawler",
                username: "jlawlz",
                password: "password"
                )

    visit '/login'
    fill_in "Username", with: "jlawlz"
    fill_in "Password", with: "wrong"

    click_button "Submit"

    expect(current_path).to eq '/login'
    expect(page).to have_content "Username or password incorrect."

    fill_in "Username", with: "jlawlzzz"
    fill_in "Password", with: "password"
    click_button "Submit"

    expect(page).to have_content "Username or password incorrect."
    expect(current_path).to eq '/login'

    fill_in "Username", with: "jlawlzzz"
    fill_in "Password", with: "wrong"
    click_button "Submit"

    expect(page).to have_content "Username or password incorrect."
    expect(current_path).to eq '/login'
  end
end
