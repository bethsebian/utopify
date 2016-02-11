require 'rails_helper'

RSpec.feature "user not logged in adds items to cart" do
	scenario "clicks the checkout button" do
		store = Store.create(title: "test", accreditations: ["Hurray"])
		category_1 = create_list(:category_with_items, 3)
		item_1, item_2, item_3 = category_1[0].items
		store.items << [item_1, item_2, item_3]

    visit store_path(store.slug)

    expect(page).to have_content("My Cart: 0")

		first(:button, "Add To Cart").click
    expect(page).to have_content("My Cart: 1")
    save_and_open_page
    click_on()
  end
end

# as a user,
# when I go shopping and I add items to my cart
# when I click on the link to "checkout",
# if I am not logged in,
# I see an error message telling me that I need to log in before I can checkout
