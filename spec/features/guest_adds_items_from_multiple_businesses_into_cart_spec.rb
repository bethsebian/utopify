require 'rails_helper'

RSpec.feature "guest visits stores" do
	scenario "and adds items to cart" do
		store_1 = Store.create(title: "test", accreditations: ["Hurray"])
		store_2 = Store.create(title: "bad store", accreditations: ["booooo"])
    store_3 = Store.create(title: "third store", accreditations: ["people like us"])
		category_1 = create(:category_with_items, items_count: 6)
		item_1, item_2, item_3, item_4, item_5, item_6 = category_1.items
		store_1.items << [item_1, item_2, item_3]
		store_2.items << [item_4, item_5, item_6]
    store_3.items <<[item_3, item_6]

    visit root_path

    expect(page).to have_content("My Cart: 0")

    first(:link, store_1.title).click

    expect(current_path).to eq(store_path(store_1.slug))

    first(:button, "Add To Cart").click
    click_on("Utopify")
    first(:link, store_2.title).click

    expect(current_path).to eq(store_path(store_2.slug))

    first(:button, "Add To Cart").click
    click_on("Utopify")
    first(:link, store_3.title).click

    expect(current_path).to eq(store_path(store_3.slug))

    first(:button, "Add To Cart").click

    expect(page).to have_content("My Cart: 3")

    click_on("My Cart: 3")

    expect(page).to have_content("Cart Contents")
    expect(page).to have_content(store_1.title)
    expect(page).to have_content(store_2.title)
    expect(page).to have_content(store_3.title)
    expect(current_path).to eq(cart_path)

  end
end
