require 'rails_helper'

RSpec.feature "user can register a store" do
	scenario "user clicks on 'register store' and can submit store info" do
    user = create(:user)

    visit root_path

    click_on "Login"
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Sign In"
    click_on "Register a Store"

    fill_in "Title", with: "title"
    fill_in "Description", with: "store description"
    fill_in "Image url", with: "www.example.com"
    fill_in "Accreditations", with: "something"
    click_on "Register Store"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("title has been submitted for review.")
    expect(Store.last.status).to eq "pending"
    expect(Store.last.title).to eq "title"
  end
end
