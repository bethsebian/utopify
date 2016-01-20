require 'rails_helper'

RSpec.feature "Admin can login" do
  scenario "Admin user is redirected to admin dashboard when logging in" do
    admin = create(:user, role: 1)

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Sign In"

    expect(current_path).to eq admin_dashboard_path
    expect(page).to have_content "Admin Dashboard"
  end

  scenario "default user does not see admin dashboard when logging in" do
    user = create(:user)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(current_path).to_not eq admin_dashboard_path
    expect(current_path).to eq dashboard_path
    expect(page).to_not have_content "Admin Dashboard"
  end

  scenario "can navigate to dashboard from link on top left" do
    admin = create(:user, role: 1)

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Sign In"
    click_link "Logged in as #{admin.first_name}"

    expect(current_path).to eq admin_dashboard_path
    expect(page).to have_content "Admin Dashboard"
  end
end
