require 'rails_helper'

RSpec.feature "admin visits dashboard" do
	scenario "sees store and order info" do
    category_1 = create(:category_with_items, items_count: 1)
		category_2 = create(:category_with_items, items_count: 1)
		category_3 = create(:category_with_items, items_count: 1)
		category_4 = create(:category_with_items, items_count: 1)

		item_1 = category_1.items.first
		item_2 = category_2.items.first
		item_3 = category_3.items.first
		item_4 = category_4.items.first

		order_1 = create(:order, status: "pending")
		order_2 = create(:order, status: "paid")
		order_3 = create(:order, status: "completed")
		order_4 = create(:order, status: "cancelled")

		order_1.items << [item_4]
		order_2.items << [item_4, item_3]
		order_3.items << [item_4, item_3, item_2]
		order_4.items << [item_4, item_3, item_2, item_1]

    store_admin = create(:user, role: 1)
		store = create(:store, user_id: store_admin.id)
		store.items << [item_4, item_3, item_2, item_1]



    store.user_id = store_admin.id

    visit login_path
    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    expect(page).to have_content(store.title)
    expect(page).to have_content(store.description)

    # within("#sales_summary") do
    #   expect(page).to have_content()


    # expect(page).to have_content("Sales Summary Data")
    # expect(page).to have_content(store.title)
    # visit store_dashboard_index_path(store.slug)







  end
end
