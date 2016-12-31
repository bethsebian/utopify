require 'rails_helper'

RSpec.feature "platform admin visits store home page" do
  scenario "loggs in and clicks a link to view the site dashboard" do
    platform_admin = create(:user, role: 2)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => platform_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(platform_admin_dashboard_index_path)

    expect(page).to have_content("Site Dashboard")
    click_on("Site Dashboard")
    expect(current_path).to eq(platform_admin_dashboard_index_path)
  end
end

RSpec.feature "platform admin visits store home page" do
  scenario "loggs in and clicks a link to view their personal dashboard" do
    platform_admin = create(:user, role: 2)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => platform_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(platform_admin_dashboard_index_path)

    expect(page).to have_content("Site Dashboard")
    click_on("Site Dashboard")
    click_on("My Dashboard")
    expect(current_path).to eq(dashboard_path)
  end
end
