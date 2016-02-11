require 'rails_helper'

RSpec.feature "Permission Service determines all users' activities" do
	attr_reader :registered_user,
							:store_admin,
							:platform_admin,
							:store,
							:item,
							:category

	before(:all) do
		@registered_user 	= create(:user, username: "registered_user")
		@store_admin 			= create(:user, role: 1, username: "store_admin")
		@platform_admin 	= create(:user, role: 2, username: "platform_admin")
		@category 				= create(:category_with_items, items_count: 1)
		@item 						= @category.items.first
		@store 						= create(:store)
		@store.items << @item
		@store_admin.stores << @store
	end

  it "can access the homepage (home#index)" do
		approved = [registered_user, store_admin, platform_admin]
		approved.each do |user|
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit root_path
			expect(current_path).to eq root_path
		end
	end

	it "can add an item to a cart (cart_items#create)" do
		approved = [registered_user, store_admin, platform_admin]
		approved.each do |user|
			page.click_link('Logout') if page.has_link?('Logout')
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit store_item_path(store.slug, item.slug)
			expect(current_path).to eq store_item_path(store.slug, item.slug)
			expect(page).to have_content("My Cart: 0")
			click_on "Add To Cart"
			expect(page).to have_content("My Cart: 1")
		end
	end

	it "can place an order and reset their cart (cart_items#destroy)" do
		approved = [registered_user, store_admin, platform_admin]
		approved.each do |user|
			page.click_link('Logout') if page.has_link?('Logout')
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit store_item_path(store.slug, item.slug)
			expect(current_path).to eq store_item_path(store.slug, item.slug)
			expect(page).to have_content("My Cart: 0")
			click_on "Add To Cart"
			expect(page).to have_content("My Cart: 1")
			click_on "My Cart: 1"
			expect(current_path).to eq('/cart')
			click_on "Checkout"
			expect(page).to have_content("Order was successfully placed.")
		end
	end

	it "can access update quantity of items in their cart (cart_items#update)" do
		approved = [registered_user, store_admin, platform_admin]
		approved.each do |user|
			page.click_link('Logout') if page.has_link?('Logout')
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit store_item_path(store.slug, item.slug)
			expect(current_path).to eq store_item_path(store.slug, item.slug)
			expect(page).to have_content("My Cart: 0")
			click_on "Add To Cart"
			expect(page).to have_content("My Cart: 1")
			click_on "My Cart: 1"
			expect(current_path).to eq('/cart')
			fill_in "qty_update_data_quantity", with: 2
			click_on "Update quantity"
			expect(page).to have_content("My Cart: 2")
		end
	end

	it "can view the page listing all categories (categories#index)" do
		approved = [registered_user, store_admin, platform_admin]
		approved.each do |user|
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit categories_path
			expect(current_path).to eq(categories_path)
		end
	end

	it "can access an individual category's page and items (categories#show)" do
		approved = [registered_user, store_admin, platform_admin]
		approved.each do |user|
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit category_path(category.slug)
			expect(current_path).to eq(category_path(category.slug))
		end
	end

	it "can access the page showing all items (items#index)" do
		approved = [registered_user, store_admin, platform_admin]
		approved.each do |user|
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit store_path(store.slug)
			expect(current_path).to eq(store_path(store.slug))
		end
	end

	it "can access one item's page (items#show)" do
		approved = [registered_user, store_admin, platform_admin]
		approved.each do |user|
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit store_item_path(store.slug, item.slug)
			expect(current_path).to eq(store_item_path(store.slug, item.slug))
		end
	end

	it "can access the new item's page (items#new)" do
		approved = [store_admin, platform_admin]
		approved.each do |user|
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit new_store_item_path(store.slug)
			expect(current_path).to eq(new_store_item_path(store.slug))
		end

		not_approved = [registered_user]
		not_approved.each do |user|
			ApplicationController.any_instance.stub(:current_user).and_return(user)
			visit new_store_item_path(store.slug)
			expect(current_path).to eq('/404')
		end
	end
end
