require 'rails_helper'

RSpec.feature "guest visits store page" do
	scenario "and can add item to cart" do
		store = Store.create(title: "test", accreditations: ["Hurray"])
		category_1 = create_list(:category_with_items, 3)
		item_1, item_2, item_3 = category_1[0].items
		store.items << [item_1, item_2, item_3]

    visit store_path(store.slug)

    expect(page).to have_content("My Cart: 0")

    first('.card-action').click_on('Add To Cart')
    expect(page).to have_content("My Cart: 1")
		expect(page).to have_content("My Cart: 3")
  end
end