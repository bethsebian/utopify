require 'rails_helper'
# do the same from the categories show page.

RSpec.feature "guest visits item show page" do
	scenario "clicks add to cart button and sees cart updated" do
		store = Store.create(title: "Irma Store", accreditations: ["This is good store"])
		category_1 = create_list(:category_with_items, 5)
		item_1, item_2, item_3, item_4, item_5 = category_1[0].items
		store.items << [item_1, item_2, item_3, item_4, item_5]

    visit item_path(item_1)
    save_and_open_page
    expect(page).to have_content(store.title)
    expect(page).to have_content(store.description)
    expect(page).to have_content("My Cart: 0")


    within "#home-middle" do
      expect(page).to have_content(store.items[2].title)
      expect(page).to have_content(store.items[3].title)
      expect(page).to have_content(store.items[4].title)
    end

    within "#item-index" do
      expect(page).to have_css("#store_items_for_sale", :count => store.items.count) # this test will change with the implementation of pagination
      first('.card-action').click_link('Add To Cart')
    end

    expect(page).to have_content("My Cart: 1")
    save_and_open_page


  end
end

# As a guest/user,
# when I visit item show page, and
# then cart quantity is 0, and
# I click on “Add to Cart”,
# then item is added to cart (count visible in corner), and
# cart quantity updates to 1
