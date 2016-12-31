require 'rails_helper'

RSpec.feature "guest visits store show page" do
  scenario "and sees top items and item details" do
    store_1 = Store.create(title: "test", accreditations: ["Hurray"])
    store_2 = Store.create(title: "bad store", accreditations: ["booooo"])
    category_1 = create(:category_with_items, items_count: 6)
    item_1, item_2, item_3, item_4, item_5, item_6 = category_1.items
    store_1.items << [item_1, item_2, item_3]
    store_2.items << [item_4, item_5, item_6]

    visit store_path(store_1.slug)

    expect(page).to have_content(store_1.title)
    expect(page).to have_content(store_1.description)
    expect(page).to have_content(store_1.accreditations.first)

    within "#home-middle" do
      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.title)
      expect(page).to have_content(item_3.title)
      expect(page).to_not have_content(item_4.title)
      expect(page).to_not have_content(item_5.title)
      expect(page).to_not have_content(item_6.title)
    end

    within ".item-index" do
      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.title)
      expect(page).to have_content(item_3.title)
      expect(page).to_not have_content(item_4.title)
      expect(page).to_not have_content(item_5.title)
      expect(page).to_not have_content(item_6.title)
    end
    expect(page).to have_content("My Cart: 0")

    first(:button, "Add To Cart").click

    expect(page).to have_content("My Cart: 1")
  end
end
