require 'rails_helper'

RSpec.feature "guest visits category show page" do
  scenario "clicks add to cart button and sees cart updated" do
    store = Store.create(title: "Irma Store", accreditations: ["This is good store"])
    category_1 = create_list(:category_with_items, 5)
    item_1, item_2, item_3, item_4, item_5 = category_1[0].items
    store.items << [item_1, item_2, item_3, item_4, item_5]
    guest = create(:user)

    visit category_path(item_1.category.slug)

    expect(page).to have_content("My Cart: 0")

    first(:button, "Add To Cart").click

    expect(page).to have_content("My Cart: 1")
  end
end
