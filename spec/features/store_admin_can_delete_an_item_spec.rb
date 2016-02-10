require 'rails_helper'

RSpec.feature "admin visits dashboard" do
	scenario "deletes an item from the item table" do
    category_1 = create(:category_with_items, items_count: 1)
		category_2 = create(:category_with_items, items_count: 1)

		item_1 = category_1.items.first
		item_2 = category_2.items.first

		store_admin = create(:user, role: 1)
		store = create(:store, user_id: store_admin.id)

		item_1.store = store
		item_1.save
		item_2.store = store
		item_2.save

    visit login_path
    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    within(".store-items-dashboard-table") do
			expect(page).to have_content(store.items.first.title)
			expect(page).to have_content(store.items.second.description)

			assert_equal 2, store.items.count
			first(:button, 'Delete').click
			assert_equal 1, store.items.count
			visit store_dashboard_index_path(store.slug)
			expect(page).to_not have_content(item_1.description)
    end
  end

end
