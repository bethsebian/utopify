require 'rails_helper'

RSpec.feature "store admin loggs in" do
  scenario "clicks a link to view thier store dashboard" do
    store_admin = create(:user, role: 1)
    store = create(:store, user_id: store_admin.id)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    expect(page).to have_content("Store Dashboard")
    click_on("Store Dashboard")
    expect(current_path).to eq(store_dashboard_index_path(store.slug))
  end

  scenario "store admin loggs in and clicks a link to view thier personal dashboard" do
    store_admin = create(:user, role: 1)
    store = create(:store, user_id: store_admin.id)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    expect(page).to have_content("My Dashboard")
    click_on("My Dashboard")
    expect(current_path).to eq(dashboard_path)
  end
end
