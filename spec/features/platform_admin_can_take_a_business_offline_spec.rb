require 'rails_helper'

RSpec.feature "platform admin visits dashboard" do
  scenario "within the table of active stores, clicks a link to deactivate a store" do
    store_admin = create(:user, role: 1)
    store = create(:store, user_id: store_admin.id, status: 'active')
    platform_admin = create(:user, role: 2)

    visit login_path
    fill_in "Username", :with => platform_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(platform_admin_dashboard_index_path)
    expect(page).to have_content("Site Administrator Dashboard")

    within("#active-stores") do
      expect(page).to have_content(store.title)
      click_on "Deactivate"
    end

    expect(current_path).to eq(platform_admin_dashboard_index_path)
    expect(page).to have_content("Store #{store.title} is now deactive")
    within("#deactive-stores") do
      expect(page).to have_content("#{store.title}")
    end

    within("#active-stores") do
      expect(page).to_not have_content("#{store.title}")
    end

  end
end
