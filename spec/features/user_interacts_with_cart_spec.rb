require 'rails_helper'

RSpec.feature "user interacts with cart" do
	scenario "from homepage" do
		item_1, item_2 = create(:category_with_items, items_count: 2).items
		store = create(:store)

		item_1.store = store
		item_1.save
		item_2.store = store
		item_2.save

		visit root_path

		expect(page).to have_content("My Cart: 0")

		within "div.item_#{item_1.id}" do
			click_button('Add To Cart')
		end
		expect(page).to have_content("My Cart: 1")

		within ".item_#{item_2.id}" do
			fill_in "cart_item[quantity]", with: "2"
			click_on "Add To Cart"
		end
		expect(page).to have_content("My Cart: 3")
	end
end