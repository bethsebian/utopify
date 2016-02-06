require 'rails_helper'

RSpec.feature "guest visits item page for other items in item show page category" do
	scenario "and sees item details for this other item" do
    store_1, store_2 = create_list(:store, 2)
		category_1 = create(:category_with_items, items_count: 5)
		category_2 = create(:category_with_items, items_count: 1)
		item_1, item_2, item_3, item_4, item_5 = category_1.items
		item_6, item_7, item_8, item_9, item_10 = category_2.items
		store_1.items << [item_1, item_2, item_3, item_4]
		store_1.items << item_6
		store_2.items << item_5
    visit store_item_path(store_1, store_1.items[0])

		expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
		expect(page).to have_content(item_1.category.title)
		within "#home-middle" do
			expect(page).to have_content(item_2.title)
      click_on("link-to-item-#{item_2.id}")
		end

    within "#main-item-show" do
      expect(page).to have_content(item_2.title)
      expect(page).to have_content(item_2.description)
    end
  end

  scenario "guest visits item category page" do
    store_1, store_2 = create_list(:store, 2)
		category_1 = create(:category_with_items, items_count: 5)
		category_2 = create(:category_with_items, items_count: 1)
		item_1, item_2, item_3, item_4, item_5 = category_1.items
		item_6, item_7, item_8, item_9, item_10 = category_2.items
		store_1.items << [item_1, item_2, item_3, item_4]
		store_1.items << item_6
		store_2.items << item_5

    visit store_item_path(store_1, store_1.items[0])

		expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
		expect(page).to have_content(item_1.category.title)

    click_link "#{item_1.category.title}"

		expect(current_path).to eq(category_path(item_1.category.slug))
  end

	scenario "guest can go back to the home page after browsing item pages" do
		store_1, store_2 = create_list(:store, 2)
		category_1 = create(:category_with_items, items_count: 5)
		category_2 = create(:category_with_items, items_count: 1)
		item_1, item_2, item_3, item_4, item_5 = category_1.items
		item_6, item_7, item_8, item_9, item_10 = category_2.items
		store_1.items << [item_1, item_2, item_3, item_4]
		store_1.items << item_6
		store_2.items << item_5

		visit store_item_path(store_1, store_1.items[0])
		expect(page).to have_content(item_1.title)
		expect(current_path).to eq(store_item_path(store_1, store_1.items[0]))

		click_on 'Utopify'
		expect(current_path).to eq(root_path)

	end
end



# Card 3 - Guest can return to home page
# As a guest/user,
# when I visit item show page, and
# when I click on Store Home Page,
# then I am redirected to Store Home Page
