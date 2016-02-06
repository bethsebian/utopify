require 'rails_helper'

RSpec.feature "guest visits item page" do
	scenario "and sees item details" do
		pending
		category_1 = create(:category_with_items, items_count: 1)
		category_2 = create(:category_with_items, items_count: 1)
		category_3 = create(:category_with_items, items_count: 1)
		category_4 = create(:category_with_items, items_count: 1)

		item_1 = category_1.items
		item_2 = category_2.items
		item_3 = category_3.items
		item_4 = category_4.items

		order_1 = create(:order)
		order_2 = create(:order)
		order_3 = create(:order)
		order_4 = create(:order)

		order_1 << item_1 * 1
		order_2 << item_2 * 2
		order_3 << item_3 * 3
		order_4 << item_4 * 4

		visit root_path

		within "#home-middle" do
			expect(page).to have_content(category_2.title)
			expect(page).to have_content(category_3.title)
			expect(page).to have_content(category_4.title)
			expect(page).to_not have_content(category_1.title)
		end
	end
end


# As a guest,
# when I visit the homepage, and
# there are more than 3 categories,
# I see cards for the 3 most popular categories, and
# when I click on a category,
# I am directed to that category’s index page.