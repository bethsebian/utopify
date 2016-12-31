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

    store_admin = create(:user, role: 1)
    store = create(:store, user_id: store_admin.id)
    user = create(:user, role: 0)

    item_1.store = store
    item_1.save
    item_2.store = store
    item_2.save
    item_3.store = store
    item_3.save
    item_4.store = store
    item_4.save

    order_1 = create(:order, status: "pending")
    order_2 = create(:order, status: "paid")
    order_3 = create(:order, status: "completed")
    order_4 = create(:order, status: "cancelled")

    order_1.items << [item_4]
    order_2.items << [item_4, item_3]
    order_3.items << [item_4, item_3, item_2]
    order_4.items << [item_4, item_3, item_2, item_1]

    order_1.user = user
    order_1.save
    order_2.user = user
    order_2.save
    order_3.user = user
    order_3.save
    order_4.user = user
    order_4.save
    # store.orders << [order_1, order_2, order_3, order_4]

    # store.user_id = store_admin.id
    visit login_path
    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    expect(page).to have_content(store.title)
    expect(page).to have_content(store.description)

    within("#sales_summary") do
      expect(page).to have_content(store.paid_orders.count)
      expect(page).to have_content(store.pending_orders.count)
      expect(page).to have_content(store.completed_orders.count)
      expect(page).to have_content(store.cancelled_orders.count)
    end

    within('#orders_summary') do
      expect(page).to have_content(store.pending_orders.first.total_price)
      expect(page).to have_content(store.pending_orders.first.id)
      expect(page).to have_content(store.pending_orders.first.user.username)

      expect(page).to have_content(store.paid_orders.first.total_price)
      expect(page).to have_content(store.paid_orders.first.id)
      expect(page).to have_content(store.paid_orders.first.user.username)

      expect(page).to have_content(store.cancelled_orders.first.total_price)
      expect(page).to have_content(store.cancelled_orders.first.id)
      expect(page).to have_content(store.cancelled_orders.first.user.username)

      expect(page).to have_content(store.completed_orders.first.total_price)
      expect(page).to have_content(store.completed_orders.first.id)
      expect(page).to have_content(store.completed_orders.first.user.username)
    end

    within(".store-items-dashboard-table") do
      expect(page).to have_content(store.items.first.title)
      expect(page).to have_content(store.items.second.description)
      expect(page).to have_content(store.items.third.price)
      expect(page).to have_content(store.items.fourth.category.title)

      click_on store.items.first.title
      expect(current_path).to eq(store_item_path(store.slug, store.items.first.slug))
    end

  end
end
