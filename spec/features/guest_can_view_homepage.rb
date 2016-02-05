require 'rails_helper'

RSpec.feature 'guest visits home page' do
	scenario 'sees link to browse items' do
		visit root_path

		expect(page).to have_css("p a", text: "browse-items")
		expect(page).to have_content(item_1.title)
		expect(page).to have_content(item_1.description)
		expect(page).to have_content(item_1.price)
		expect(page).to have_css('img', text: item_1.image_url)
	end

	scenario "sees first 12 items" do
		pending
		category_1 = create_list(:category_with_items)
		category_2 = create_list(:category_with_items)
		category_3 = create_list(:category_with_items)
		item_1, item_2, item_3, item_4, item_5 = category_1[0].items
		item_6, item_7, item_8, item_9, item_10 = category_2[0].items
		item_11, item_12, item_13, item_14, item_15 = category_3[0].items

		expect(page).to have_content(item_2.title)
		expect(page).to have_content(item_3.title)
		expect(page).to have_content(item_4.title)
		expect(page).to have_content(item_5.title)
		expect(page).to have_content(item_6.title)
		expect(page).to have_content(item_7.title)
		expect(page).to have_content(item_8.title)
		expect(page).to have_content(item_9.title)
		expect(page).to have_content(item_10.title)
		expect(page).to have_content(item_11.title)
		expect(page).to have_content(item_12.title)
		expect(page).to_not have_content(item_13.title)
		expect(page).to_not have_content(item_14.title)
		expect(page).to_not have_content(item_15.title)
	end
end