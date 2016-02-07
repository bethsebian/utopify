require 'rails_helper'

RSpec.feature "guest navigates" do
	scenario "user views cart" do
		visit root_path
		click_on "Cart"
		expect(current_path).to eq "/cart"
		expect(page).to have_content("Cart Contents:")
  end

	# scenario "user views categories" do
	# 	visit
	#
	# 	# As a guest,
	# 	# when I click_on "Categories" in the navbar,
	# 	# I'm redirected to the categories index page
	# 	# and the url is "/categories"
	# 	# and I see a list of all categories
	# end
end

# As a guest,
# when I'm on the homepage,
# and I click_on "Cart" in the navbar,
# I'm redirected to the cart show page
# and the url is "/cart"
# and I see a cart total of $0.00
#
# As a guest,
# when I click_on "Categories" in the navbar,
# I'm redirected to the categories index page
# and the url is "/categories"
# and I see a list of all categories
#
# As a guest,
# when I'm on the homepage,
# and I click on an item,
# I'm redirected to the item show page,
# and the url is 	"stores/store-slug/items/item-slug”
# and I see the item title
#
# As a platform admin,
# when I'm on the homepage,
# and I click login,
# and I enter my credentials,
# and click on “submit”,
# I'm directed to my platform_admin dashboard,
# and the url is '/administrator/dashboard'
#
# As a regular customer,
# when I'm on the homepage,
# and I click login,
# and I enter my credentials,
# I'm directed to my dashboard,
# and the url is '/users/dashboard',
# and I see my name on the page,
# and I don't see other users' information
#
# As a regular customer,
# when I'm on the homepage,
# and I click login,
# and I enter my credentials,
# and I click submit,
# and I navigate to '/administrator/dashboard',
# I'm redirected to my dashboard,
# and the url is '/users/dashboard'
#
# As a user,
# when I'm on the homepage,
# and I click on a store name,
# I'm directed to that store page,
# and the url is '/stores/store-slug'
#
# As a guest,
# when I'm on the homepage,
# and I click on "Sign Up,"
# I'm directed to the sign-up page,
# and the url is '/users/new'
# and I fill in my info,
# and I click "Submit",
# I'm redirected to my new dashboard,
# and the url is 'users/dashboard'