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

		expect(page).to have_content(store.items.first.title)
		expect(page).to have_content(store.items.first.description)
		expect(page).to have_content(store.items.second.title)
		expect(page).to have_content(store.items.second.description)

		expect(Item.where(store_id: store.id, active: true).count).to eq(2)
		expect(Item.where(store_id: store.id).count).to eq(2)

		within(".store-items-dashboard-table") do
			first(:button, 'Delete').click
		end

		expect(Item.where(store_id: store.id).count).to eq(2)
		expect(Item.where(store_id: store.id, active: true).count).to eq(1)
		expect(Item.where(store_id: store.id, active: false).count).to eq(1)

		expect(Item.where(description: item_1.description).count).to eq(1)
		within(".store-items-dashboard-table") do
			expect(page).to_not have_content(item_1.description)
		end
  end
end
