require 'rails_helper'

RSpec.feature "guest navigates" do
	scenario "user views cart" do
		visit root_path
		click_on "Cart"
		expect(current_path).to eq "/cart"
		expect(page).to have_content("Cart Contents:")
  end

	scenario "user views categories" do
		visit root_path
		click_on "Browse All Categories"
		expect(current_path).to eq "/categories"
		expect(page).to have_content("Our Categories")
  end

	scenario "user views item" do
		item = create(:category_with_items, items_count: 1).items.first
		store = create(:store)
		store.items << item

		visit root_path

		click_on "#{item.title}"

		expect(page).to have_content("#{item.title}")
		expect(page).to have_content("#{item.description}")
		expect(current_path).to eq "/stores/#{store.slug}/items/#{item.slug}"
  end

	scenario "user views store" do
		store = create(:store)
		item = create(:category_with_items, items_count: 1).items.first
		store.items << item

		visit root_path
		click_on "#{store.title}"

		expect(current_path).to eq "/stores/#{store.slug}"
		expect(page).to have_content("#{store.title}")
	end

	scenario "platform admin views dashboard" do
		platform_admin = create(:user, role: 2)

		visit root_path
		click_on "Login"

		page.fill_in 'Username', :with => platform_admin.username
		page.fill_in 'Password', :with => platform_admin.password
		click_on "Sign In"

		expect(current_path).to eq "/platform_admin/dashboard"
		expect(page).to have_content("Site Administrator Dashboard")
	end

	# scenario "user views dashboard" do
	# 	user_1 = create(:user)
	# 	user_2 = create(:user)
	# 	visit root_path
	# 	click_on "Login"
	#
	# 	page.fill_in 'Username', :with => user_2.username
	# 	page.fill_in 'Password', :with => user_2.password
	# 	click_on "Sign In"
	#
	# 	expect(current_path).to eq "/dashboard"
	# 	expect(page).to have_content("Welcome #{user_2.first_name}!")
	# 	expect(page).to have_content("Welcome #{user_1.first_name}!")
	# end

end

#
# As a regular customer,
# when I'm on the homepage,
# and I click login,
# and I enter my credentials,
# and I click submit,
# and I navigate to '/administrator/dashboard',
# I'm redirected to my dashboard,
# and the url is '/users/dashboard'

# As a guest,
# when I'm on the homepage,
# and I click on "Sign Up,"
# I'm directed to the sign-up page,
# and the url is '/users/new'
# and I fill in my info,
# and I click "Submit",
# I'm redirected to my new dashboard,
# and the url is 'users/dashboard'

