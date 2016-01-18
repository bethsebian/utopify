require 'rails_helper'

RSpec.feature "Admin can login" do
  scenario "Admin user is redirected to admin dashboard when logging in" do
    admin = User.create(first_name: "mister",
                        last_name: "admin",
                        username: "admin",
                        password: "admin",
                        role: 1)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password

    click_button "Submit"

    expect(current_path).to eq admin_dashboard_path
    expect(page).to have_content "Admin Dashboard"
  end

  scenario "default user does not see admin dashboard when logging in" do
    user = User.create(first_name: "default",
                       last_name: "user",
                       username: "default_user",
                       password: "default",
                       role: 0 )

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Submit"

    expect(current_path).to_not eq admin_dashboard_path
    expect(current_path).to eq dashboard_path
    expect(page).to_not have_content "Admin Dashboard"
  end
end
