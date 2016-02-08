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

	scenario "store admin views dashboard" do
		store_admin = create(:user, role: 1)
		store 			= create(:store, user_id: store_admin.id)
		visit root_path
		click_on "Login"

		page.fill_in 'Username', :with => store_admin.username
		page.fill_in 'Password', :with => store_admin.password
		click_on "Sign In"

		expect(current_path).to eq "/stores/#{store.slug}/dashboard"

		expect(page).to have_content("#{store.title} Dashboard")
	end

	scenario "user views dashboard" do
		user_1 = create(:user)
		user_2 = create(:user)
		visit root_path
		click_on "Login"

		page.fill_in 'Username', :with => user_2.username
		page.fill_in 'Password', :with => user_2.password
		click_on "Sign In"

		expect(current_path).to eq "/dashboard"

		expect(page).to have_content("#{user_2.first_name}'s Profile")
		expect(page).to_not have_content("#{user_1.first_name}'s' Profile")
	end

	scenario "regular user cannot view platform admin dashboard" do
		pending
		user = create(:user)

		ApplicationController.any_instance.stub(:current_user).and_return(user)

		visit platform_admin_dashboard_index_path
		expect(current_path).to eq "/dashboard"
		expect(page).to have_content("#{user.first_name}'s Profile")

		expect(current_path).to_not eq "/platform_admin/dashboard"
		expect(page).to_not have_content("Site Administrator Dashboard")
	end

	scenario "user views dashboard" do
		pending
		visit root_path
		click_on "Sign Up"

    fill_in "First Name:", with: "User_first"
    fill_in "Last Name:", with: "User_last"
    fill_in "Username:", with: "Username"
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation", with: "password"

    within "form#new_user" do
      click_button "Create"
    end

		expect(current_path).to eq "/dashboard"

		expect(page).to have_content("#{user_2.first_name}'s Profile")
		expect(page).to_not have_content("#{user_1.first_name}'s' Profile")
	end
end