require 'rails_helper'

RSpec.feature "guest visits item page" do
	scenario "and sees item details" do
		store = create(:store)
		category_1 = create(:category_with_items, items_count: 3)
		category_2 = create(:category_with_items, items_count: 1)
		item_1, item_2, item_3 = category_1.items
		item_4 = category_2.items.first
		store.items << [item_1, item_2, item_3, item_4]

		visit store_item_path(item_1.store.slug, item_1.slug)

		expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
		expect(page).to have_content(item_1.price)
		expect(page).to have_content(item_1.category.title)
		expect(page).to have_content(item_1.store.title)

		within "#home-middle" do
			expect(page).to have_content(item_2.title)
			expect(page).to have_content(item_3.title)
			expect(page).to_not have_content(item_4.title)
		end
	end
end
