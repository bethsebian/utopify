require 'rails_helper'

RSpec.feature "guest visits item page" do
	scenario "and sees item details" do
		store = Store.create(title: "test", accreditations: ["Hurray"])
		# store_2 = Store.create(title: "bad store", accreditations: ["booooo"])
		category_1 = create_list(:category_with_items, 5)
		category_2 = create_list(:category_with_items, 1)
		item_1, item_2, item_3, item_4, item_5 = category_1[0].items
		item_6, item_7, item_8, item_9, item_10 = category_2[0].items
		store.items << [item_1, item_2, item_3, item_4, item_6, item_7, item_8, item_9, item_10]
		# store_2.items << item_5

    visit store_path(store.slug)

    expect(page).to have_content(store.title)
    expect(page).to have_content(store.description)
    expect(page).to have_content(store.accreditations[0])
    expect(page).to have_content("My Cart: 0")


    within "#home-middle" do
      expect(page).to have_content(store.items[0].title)
      expect(page).to have_content(store.items[1].title)
      expect(page).to have_content(store.items[2].title)
    end

    within "#item-index" do
      expect(page).to have_css("#store_items_for_sale", :count => store.items.count) # this test will change with the implementation of pagination
      first('.card-action').click_on('Add To Cart')
    end

    expect(page).to have_content("My Cart: 1")

		within "#item-index" do
      expect(page).to have_css("#store_items_for_sale", :count => store.items.count) # this test will change with the implementation of pagination
			first('.card-action').click_on('Add To Cart')
			first('.card-action').click_on('Add To Cart')
		end

		expect(page).to have_content("My Cart: 3")

  end
end

# As a guest,
# when I visit a store’s page,
# I see a list of all items sold by that shop, and
# I can add 1 item to my cart, and
# I will see my cart quantity update to 1, and
# I can add a second item to my cart with a quantity of two, and
# I will see my cart qty update to three.
