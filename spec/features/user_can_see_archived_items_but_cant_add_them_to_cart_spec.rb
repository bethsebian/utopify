require 'rails_helper'

RSpec.feature "user can view archived items in order history" do
	scenario "but cannot add them to cart" do

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
end
end

# As a registered user,
# When i visit my order history
# Then I can see inactive/archived items
# but I can not add them to cart
