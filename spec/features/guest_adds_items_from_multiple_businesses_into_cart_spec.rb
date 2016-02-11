require 'rails_helper'

RSpec.feature "guest visits store show page" do
	scenario "and sees top items and item details" do
		store_1 = Store.create(title: "test", accreditations: ["Hurray"])
		store_2 = Store.create(title: "bad store", accreditations: ["booooo"])
    store_3 = Store.create(title: "third store", acrreditations: ["people like us"])
		category_1 = create(:category_with_items, items_count: 6)
		item_1, item_2, item_3, item_4, item_5, item_6 = category_1.items
		store_1.items << [item_1, item_2, item_3]
		store_2.items << [item_4, item_5, item_6]
    store_3.items <<[item_3, item_6]

    visit root_path
