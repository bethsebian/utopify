require 'rails_helper'
include ActionView::Helpers::NumberHelper

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

	scenario "from store page" do
		item_1, item_2 = create(:category_with_items, items_count: 2).items
		store = create(:store)

		item_1.store = store
		item_1.save
		item_2.store = store
		item_2.save

		visit store_path(store.slug)

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

	scenario "they see their cart items" do
		item_1, item_2 = create(:category_with_items, items_count: 2).items
		store = create(:store)

		item_1.store = store
		item_1.save
		item_2.store = store
		item_2.save

		visit store_path(store.slug)

		within "div.item_#{item_1.id}" do
			click_button('Add To Cart')
		end
		within ".item_#{item_2.id}" do
			fill_in "cart_item[quantity]", with: "2"
			click_on "Add To Cart"
		end

		cart_price = (item_1.price.to_i * 1) + (item_2.price.to_i * 2)

		click_on "My Cart"

		expect(current_path).to eq('/cart')
		expect(page).to have_content(item_1.title)
		within "td.cart-qty-#{item_1.id}" do
			expect(page).to have_field('qty_update_data[quantity]', with: 1)
		end
    expect(page).to have_content(item_1.store.title)
		expect(page).to have_content(number_to_currency(item_1.price))
		expect(page).to have_content(number_to_currency(item_1.price.to_i*1))
		expect(page).to have_content(item_2.title)
		within "td.cart-qty-#{item_2.id}" do
			expect(page).to have_field('qty_update_data[quantity]', with: 2)
		end
    expect(page).to have_content(item_2.store.title)
		expect(page).to have_content(number_to_currency(item_2.price))
		expect(page).to have_content(number_to_currency(item_2.price.to_i*2))
		expect(page).to have_content(number_to_currency(cart_price))
  end

	scenario "they can delete items in their cart" do
		item_1, item_2 = create(:category_with_items, items_count: 2).items
		store = create(:store)

		item_1.store = store
		item_1.save
		item_2.store = store
		item_2.save

		visit store_path(store.slug)

		within "div.item_#{item_1.id}" do
			click_button('Add To Cart')
		end
		within ".item_#{item_2.id}" do
			fill_in "cart_item[quantity]", with: "2"
			click_on "Add To Cart"
		end

		cart_price = (item_1.price.to_i * 1) + (item_2.price.to_i * 2)

		click_on "My Cart"
		within "#item_#{item_1.id}_delete_link" do
			click_on "Remove"
		end

		expect(current_path).to eq('/cart')
		expect(page).to have_content("Successfully removed #{item_1.title} from your cart.")
		expect(page).to have_content(item_2.title)
		expect(page).to_not have_css("#item_#{item_1.id}_delete_link")
		within "#cart-total-price" do
			expect(page).to have_content(number_to_currency(item_2.price.to_i*2))
		end
  end

	scenario "they can delete the last item from their cart" do
		item_1 = create(:category_with_items, items_count: 1).items.first
		store = create(:store)
		item_1.store = store
		item_1.save

		visit store_path(store.slug)
		within "div.item_#{item_1.id}" do
			click_button('Add To Cart')
		end
		click_on "My Cart"
		click_on "Remove"

		expect(current_path).to eq('/cart')
		expect(page).to have_content("Successfully removed #{item_1.title} from your cart.")
		expect(page).to_not have_css("#item_#{item_1.id}_delete_link")
		within "#cart-total-price" do
			expect(page).to have_content("$0.00")
		end
  end
end