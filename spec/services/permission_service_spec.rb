require 'rails_helper'

RSpec.describe "Permission Service determines all users' activities" do
	attr_reader :registered_user, :store_admin, :platform_admin, :store, :item

	before(:all) do
		# binding.pry
		@registered_user 	= create(:user, username: "registered_user")
		@store_admin 			= create(:user, role: 1, username: "store_admin")
		@platform_admin 	= create(:user, role: 2, username: "platform_admin")
		@category 				= create(:category_with_items, items_count: 1)
		@item 						= @category.items.first
		@store 						= create(:store)
		@store.items << @item
	end

	  it "can access the homepage (home#index)" do
			approved = [registered_user, store_admin, platform_admin]
			approved.each do |user|
				ApplicationController.any_instance.stub(:current_user).and_return(user)
				visit root_path
				expect(current_path).to eq root_path
			end
		end
end
	  # it "can add an item to a cart (cart_items#create)" do
		# 	visit store_item_path(store.slug, item.slug)
		# 	expect(current_path).to eq store_item_path(store.slug, item.slug)
		# 	expect(page).to have_content("My Cart: 0")
		# 	click_on "Add To Cart"
		# 	expect(page).to have_content("My Cart: 1")
		# end

	  # it "can place an order and reset their cart (cart_items#destroy)" do
		# 	visit store_item_path(store.slug, item.slug)
		# 	expect(current_path).to eq store_item_path(store.slug, item.slug)
		# 	expect(page).to have_content("My Cart: 0")
		# 	click_on "Add To Cart"
		# 	expect(page).to have_content("My Cart: 1")
		# 	click_on "My Cart: 1"
		# 	expect(current_path).to eq('/cart')
		# 	click_on "Checkout"
		# 	expect(page).to have_content("Order was successfully placed.")
		# end
		#
	  # it "can access update quantity of items in their cart (cart_items#update)" do
		# 	visit store_item_path(store.slug, item.slug)
		# 	expect(current_path).to eq store_item_path(store.slug, item.slug)
		# 	expect(page).to have_content("My Cart: 0")
		# 	click_on "Add To Cart"
		# 	expect(page).to have_content("My Cart: 1")
		# 	click_on "My Cart: 1"
		# 	expect(current_path).to eq('/cart')
		# 	fill_in "qty_update_data_quantity", with: 2
		# 	click_on "Update quantity"
		# 	expect(page).to have_content("My Cart: 2")
		# end
		#
		# it "can view the page listing all categories (categories#index)" do
		# 	visit categories_path
		# 	expect(current_path).to eq(categories_path)
		# end
		#
		# it "can access an individual category's page and items (categories#show)" do
		# 	visit category_path(category)
		# 	expect(current_path).to eq(category_path)
		# end
		#
		# it "can access the page showing all items (items#index)" do
		# 	visit store_items_path(store.slug)
		# 	expect(current_path).to eq(store_items_path(store.slug))
		# end
		#
		# it "can access one item's page (items#show)" do
		# 	visit store_item_path(store.slug, item.slug)
		# 	expect(current_path).to eq(store_item_path(store.slug, item.slug))
		# end
		#
		# it "can access the new item's page (items#new)" do
		# 	visit new_store_item_path(store.slug)
		# 	expect(current_path).to eq(new_store_item_path(store.slug))
		# end
		#
		# it "can create a new item (items#create)" do
		# 	visit new_store_item_path(store.slug)
		# 	expect(current_path).to eq(new_store_item_path(store.slug))
		#
		# 	within("#new-item-form") do
		# 		fill_in "Title", with: "New Item"
		# 		fill_in "Description", with: "New description"
		# 		fill_in "Image Url", with: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwi33_2fiezKAhVnuYMKHXjtANkQjRwIAw&url=http%3A%2F%2Fjosephcphillips.com%2F2015%2F07%2Fof-course-bill-cosby-is-guilty%2F&psig=AFQjCNEMITizMWYxf5CZgZDU6BWWlr6a6w&ust=1455155083470723	"
		# 		fill_in "Price", with: 567
		# 		# select "value[2]", :from => "item[category]"
		# 		click_on "Submit"
		# 	end
		#
		# 	expect(page).to have_content("Your item was successfully created")
		# end
		#
		#
		# it "can access the edit item page (items#edit)" do
		# 	visit edit_store_item_path(store.slug)
		# 	expect(page).to eq(edit_store_item_path(store.slug))
		# end
		#
		# it "can edit an item (items#update)" do
		#
		# it "can access the page with all their orders (orders#index)" #won't need do
		# it "can create an order (orders#create)" do
		# it "can access an order's show page (orders#show)" do
		# it "can update the status of an order (orders#update)" do
		#
		# it "can log in (sessions#new)" do
		# it "can access log in (sessions#create)" do
		# it "can access log out (sessions#destroy)" do
		#
		# it "can access a store's page (stores#show)" do
		# it "can create a new store (stores#create)" do
		# it "can update a store's information (stores#update)" do
		#
		# it "can access the new account page (users#new)" do
		# it "can create a new account (users#create)" do
		# it "can access a user's dashboard (users#show)" do
		#
		# it "can access the platform admin's dashboard (platform_admin/dashboard#show)" do
		# it "can access the platform admin's dashboard (platform_admin/dashboard#index)" # won't need do





# def platform_admin_permissions
# 	return true if controller == "home" && action.in?(%w(index))
# 	return true if controller == "cart_items" && action.in?(%w(create destroy update))
# 	return true if controller == "platform_admin/dashboard" && action.in?(%w(show index) # confirm show is needed
# 	return true if controller == "categories" && action.in?(%w(index show edit update))
# 	return true if controller == "dashboard" && action.in?(%w(index))
# 	return true if controller == "items" && action.in?(%w(index show new create edit update))
# 	return true if controller == "orders" && action.in?(%w(index create show update))
# 	return true if controller == "sessions" && action.in?(%w(new create destroy))
# 	return true if controller == "stores" && action.in?(%w(show new create update))
# 	return true if controller == "users" && action.in?(%w(new create show))
# end
#
# def store_admin_permissions
# 	return true if controller == "home" && action.in?(%w(index))
# 	return true if controller == "cart_items" && action.in?(%w(create destroy update))
# 	return true if controller == "categories" && action.in?(%w(index show))
# 	return true if controller == "platform_admin/dashboard" && action.in?(%w(show index) all
# 	return true if controller == "dashboard" && action.in?(%w(index)) show edit update
# 	return true if controller == "items" && action.in?(%w(index show new create edit update))
# 	return true if controller == "orders" && action.in?(%w(index create show update))
# 	return true if controller == "sessions" && action.in?(%w(new create destroy))
# 	return true if controller == "stores" && action.in?(%w(show new create update))
# 	return true if controller == "users" && action.in?(%w(new create show))
# end
#
# def global_admin_permissions
# 	return true if controller == "home" && action.in?(%w(index))
# 	return true if controller == "cart_items" && action.in?(%w(create destroy update))
# 	return true if controller == "categories" && action.in?(%w(index show))
# 	return true if controller == "platform_admin/dashboard" && action.in?(%w(show index) all
# 	return true if controller == "items" && action.in?(%w(index show)) new create edit update
# 	return true if controller == "orders" && action.in?(%w(index create show)) update
# 	return true if controller == "sessions" && action.in?(%w(new create destroy))
# 	return true if controller == "stores" && action.in?(%w(show)) new create update
# 	return true if controller == "users" && action.in?(%w(new create show))
# end

