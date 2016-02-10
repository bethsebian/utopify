require 'rails_helper'

RSpec.feature "admin visits dashboard" do
	scenario "sees store and order info" do
    category_1 = create(:category_with_items, items_count: 1)

		item_1 = category_1.items.first

		store_admin = create(:user, role: 1)
		store = create(:store, user_id: store_admin.id)
		user = create(:user, role: 0)

		item_1.store = store
		item_1.save

    visit login_path
    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    expect(page).to have_content(store.title)
    expect(page).to have_content(store.description)

		within(".store-items-dashboard-table") do
			expect(page).to have_content(store.items.first.title)
			expect(page).to have_content(store.items.first.description)
      click_on "Add an item"
		end
    expect(current_path).to eq(new_store_item_path(store.slug))

    within("#new-item-form") do
    fill_in("title"), with: "New Item"
    fill_in("description"), with: "New description"
    # fill_in("Image")
    # I select the item category from the list,
    # and I click on submit
    end
  end
end
