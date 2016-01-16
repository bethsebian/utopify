require 'rails_helper'

RSpec.feature "Admin can login" do
  scenario "Admin user is redirected to admin dashboard when logging in" do
    admin = User.create(first_name: "mister", last_name: "admin", username: "admin", password: "admin", role: 1)

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "admin"

    click_button "Submit"

    expect(current_path).to eq admin_dashboard_path
    expect(page).to have_content "Admin Dashboard"
  end

end
