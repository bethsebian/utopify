require 'rails_helper'

RSpec.feature "guest visits item page" do
	scenario "and sees item details" do
		store = Store.create(title: "test", accreditation: "Hurray")
		store_2 = Store.create(title: "bad store", accreditation: "booooo")
		category_1 = create_list(:category_with_items, 5)
		category_2 = create_list(:category_with_items, 1)
		item_1, item_2, item_3, item_4, item_5 = category_1[0].items
		item_6, item_7, item_8, item_9, item_10 = category_2[0].items
		store.items << [item_1, item_2, item_3, item_4, item_6]
		store_2.items << item_5
		visit store_item_path(store, store.items[0])
		expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
		expect(page).to have_content(item_1.price)
		expect(page).to have_content(item_1.category.title)
		expect(page).to have_content(item_1.store.title)

		within "#home-middle" do
			expect(page).to have_content(item_2.title)
			expect(page).to have_content(item_3.title)
			expect(page).to have_content(item_4.title)
			expect(page).to_not have_content(item_5.title)
		end
	end
end
