require 'rails_helper'

RSpec.feature "guest visits item page" do
	scenario "and sees item details" do
		store = Store.create(title: "test", accreditations: "Hurray")
		category_1 = create_list(:category_with_items, 4)
		category_2 = create_list(:category_with_items, 1)
		item_1, item_2, item_3, item_4 = category_1[0].items
		item_5 = category_2[0].items
		store.items << [item_1, item_2, item_3, item_4, item_5]

		visit item_path(item_1)

		expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
		expect(page).to have_content(item_1.price)
		expect(page).to have_content(item_1.category)
		expect(page).to have_content(item_1.store.title)
		expect(page).to have_content(item_1.store.accreditations)

		within "#home-middle" do
			expect(page).to have_content(item_2.title)
			expect(page).to have_content(item_3.title)
			expect(page).to have_content(item_4.title)
			expect(page).to_not have_content(item_5.title)
		end
	end
end