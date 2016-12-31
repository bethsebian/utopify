require 'rails_helper'

RSpec.feature "guest visits item page" do
  scenario "and sees item details" do
    category_1 = create(:category_with_items, items_count: 1)
    category_2 = create(:category_with_items, items_count: 1)
    category_3 = create(:category_with_items, items_count: 1)
    category_4 = create(:category_with_items, items_count: 1)

    item_1 = category_1.items.first
    item_2 = category_2.items.first
    item_3 = category_3.items.first
    item_4 = category_4.items.first

    order_1 = create(:order)
    order_2 = create(:order)
    order_3 = create(:order)
    order_4 = create(:order)

    order_1.items << [item_4]
    order_2.items << [item_4, item_3]
    order_3.items << [item_4, item_3, item_2]
    order_4.items << [item_4, item_3, item_2, item_1]

    store = create(:store)
    store.items << [item_4, item_3, item_2, item_1]

    visit root_path

    within "#home-middle" do
      expect(page).to have_link category_2.title,
        href: category_path(category_2)
      expect(page).to have_link category_3.title,
        href: category_path(category_3)
      expect(page).to have_link category_4.title,
        href: category_path(category_4)
      expect(page).to_not have_link category_1.title,
        href: category_path(category_1)
    end
  end
end
