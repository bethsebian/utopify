require 'rails_helper'

RSpec.feature "platform admin visits dashboard and sees pending stores" do
	scenario "clicks a link to approve store" do
		store_admin = create(:user, role: 1)
		store = create(:store, user_id: store_admin.id, status: 'pending')
		platform_admin = create(:user, role: 2)

    visit login_path
    fill_in "Username", :with => platform_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(platform_admin_dashboard_index_path)
    expect(page).to have_content("Site Administrator Dashboard")

		within("#pending-stores") do
			expect(page).to have_content(store.title)
      click_on "Approve"
		end

		expect(current_path).to eq(platform_admin_dashboard_index_path)
    save_and_open_page
    expect(page).to have_content("Store #{store.title} has been successfully created and approved")
		within("#active-stores") do
			expect(page).to have_content("#{store.title}")
		end
  end
end
# As a platform admin,
# when I login,
# I am directed to my dashboard,
# and I see a list of pending stores,
# and when I click on approve,
# I see a flash notice that the store has been successfully created,
# and the store is now visible in the live stores section.
