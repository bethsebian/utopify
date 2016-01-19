require 'rails_helper'

RSpec.feature "visitor can check out with items in cart" do
	scenario "with items in cart" do
		user = User.create(
		first_name: "Jordan",
		last_name: "Lawler",
		username: "jlawlz",
		password: "password"
		)

		travesty = Travesty.create(title: "Environmental Disasters")
		item_1 = travesty.items.create(
			title: "Item title 1",
			description: "Item description 1",
			price: 11,
			image_url: "app/assets/images/water_contamination.jpg"
		)
		item_2 = travesty.items.create(
			title: "Item title 2",
			description: "Item description 2",
			price: 15,
			image_url: "app/assets/images/water_contamination.jpg"
		)

		visit item_path(item_1)
		first(:button, 'Add to cart').click
		visit item_path(item_2)
		first(:button, 'Add to cart').click

		expect(page).to have_content("My Cart: 2")

		visit '/cart'
		click_on 'Checkout'

		expect(page).to have_content("Please log in to check out")
		expect(current_path).to eq login_path

		fill_in "Username", with: "jlawlz"
    fill_in "Password", with: "password"
    click_button "Submit"

		visit '/cart'
		click_on 'Checkout'

		order = Order.find_by(user_id: user.id)
		expect(order.status).to eq "ordered"
		expect(current_path).to eq orders_path
		expect(page).to have_content("Order was successfully placed")
		within "td#order_status" do
			expect(page).to have_content order.status
		end
		within "td#order_total_price" do
			expect(page).to have_content order.total_price
		end
		within "td#order_created_at" do
			expect(page).to have_content order.created_at
		end
		expect(page).to have_content("My Cart: 0")
	end
end