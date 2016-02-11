require 'rails_helper'

RSpec.feature "guest visits item page for other items in item show page category" do
	scenario "and sees item details for this other item" do
    store = create(:store)
		category_1 = create(:category_with_items, items_count: 3)
		category_2 = create(:category_with_items, items_count: 1)
		item_1, item_2, item_3 	= category_1.items
		item_4 									= category_2.items.first
		store.items << [item_1, item_2, item_3, item_4]

    visit store_item_path(item_1.store.slug, item_1.slug)

		expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
		expect(page).to have_content(item_1.category.title)

		within "#home-middle" do
			expect(page).to have_link("#{item_2.title}", href: store_item_path(item_2.store.slug, item_2.slug))
			expect(page).to have_link("#{item_3.title}", href: store_item_path(item_3.store.slug, item_3.slug))
			expect(page).to_not have_link("#{item_4.title}", href: store_item_path(item_4.store.slug, item_4.slug))
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

    visit store_item_path(item_1.store.slug, item_1.slug)

		expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
		expect(page).to have_content(item_1.category.title)

    click_link "#{item_1.category.title}"

		expect(current_path).to eq(category_path(item_1.category.slug))
  end

	scenario "guest can go back to the store for the item they are looking at" do
		store_1, store_2 = create_list(:store, 2)
		category_1 = create(:category_with_items, items_count: 5)
		category_2 = create(:category_with_items, items_count: 1)
		item_1, item_2, item_3, item_4, item_5 = category_1.items
		item_6, item_7, item_8, item_9, item_10 = category_2.items
		store_1.items << [item_1, item_2, item_3, item_4]
		store_1.items << item_6
		store_2.items << item_5

		visit store_item_path(item_1.store.slug, item_1.slug)
		expect(page).to have_content(item_1.title)
		expect(current_path).to eq "/stores/#{store_1.slug}/items/#{item_1.slug}"

		within ('#feature-details-dynamic') do
			click_on "#{item_1.store.title}"
		end

		expect(current_path).to eq "/stores/#{store_1.slug}"
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

		visit store_item_path(item_1.store.slug, item_1.slug)
		expect(page).to have_content(item_1.title)

		click_on 'Utopify'
		expect(current_path).to eq(root_path)
	end
end