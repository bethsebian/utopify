require 'rails_helper'

RSpec.describe "Permission Service authorizations determine registered user's activities" do
  it "can access homepage (home#index)" do

		"cart_items#create"
		"cart_items#destroy"
		"cart_items#update"

		"categories#index"
		"categories#show"
		"items#index"
		"items#show"
		"orders#index"
		"orders#create"
		"orders#show"
		"sessions#new"
		"sessions#create"
		"sessions#destroy"
		"stores#show"
		"users#new"
		"users#create"
		"users#show"



		return true if controller == "categories" && action.in?(%w(index show))
		return true if controller == "items" && action.in?(%w(index show))
		return true if controller == "orders" && action.in?(%w(index create show))
		return true if controller == "sessions" && action.in?(%w(new create destroy))
		return true if controller == "stores" && action.in?(%w(show))
		return true if controller == "users" && action.in?(%w(new create show))

	end

	"platform_admin/dashboard#show"
	"platform_admin/dashboard#index"
	"items#create"
	"items#edit"
	"items#update"
	"orders#update"
	"stores#create"
	"stores#update"


	it "registered user cannot access restricted pages" do
		return true if controller == "platform_admin/dashboard" && action.in?(%w(show index) all
		return true if controller == "items" && action.in?(%w(index show)) new create edit update
		return true if controller == "orders" && action.in?(%w(index create show)) update
		return true if controller == "stores" && action.in?(%w(show)) new create update
	end

	it "store admin can access their pages" do

	end

	it "store admin cannot access restricted pages" do

	end

	it "platform admin can access all pages" do

	end
end

def platform_admin_permissions
	return true if controller == "home" && action.in?(%w(index))
	return true if controller == "cart_items" && action.in?(%w(create destroy update))
	return true if controller == "platform_admin/dashboard" && action.in?(%w(show index) # confirm show is needed
	return true if controller == "categories" && action.in?(%w(index show edit update))
	return true if controller == "dashboard" && action.in?(%w(index))
	return true if controller == "items" && action.in?(%w(index show new create edit update))
	return true if controller == "orders" && action.in?(%w(index create show update))
	return true if controller == "sessions" && action.in?(%w(new create destroy))
	return true if controller == "stores" && action.in?(%w(show new create update))
	return true if controller == "users" && action.in?(%w(new create show))
end

def store_admin_permissions
	return true if controller == "home" && action.in?(%w(index))
	return true if controller == "cart_items" && action.in?(%w(create destroy update))
	return true if controller == "categories" && action.in?(%w(index show))
	return true if controller == "platform_admin/dashboard" && action.in?(%w(show index) all
	return true if controller == "dashboard" && action.in?(%w(index)) show edit update
	return true if controller == "items" && action.in?(%w(index show new create edit update))
	return true if controller == "orders" && action.in?(%w(index create show update))
	return true if controller == "sessions" && action.in?(%w(new create destroy))
	return true if controller == "stores" && action.in?(%w(show new create update))
	return true if controller == "users" && action.in?(%w(new create show))
end

def global_admin_permissions
	return true if controller == "home" && action.in?(%w(index))
	return true if controller == "cart_items" && action.in?(%w(create destroy update))
	return true if controller == "categories" && action.in?(%w(index show))
	return true if controller == "platform_admin/dashboard" && action.in?(%w(show index) all
	return true if controller == "items" && action.in?(%w(index show)) new create edit update
	return true if controller == "orders" && action.in?(%w(index create show)) update
	return true if controller == "sessions" && action.in?(%w(new create destroy))
	return true if controller == "stores" && action.in?(%w(show)) new create update
	return true if controller == "users" && action.in?(%w(new create show))
end





  it "can access the homepage (home#index)" do
  it "can create a cart (cart_items#create)"
  it "can access place an order and reset their cart (cart_items#destroy)" do
  it
"can access update quantity of items in their cart (cart_items#update)" do
it "can access view the page listing all categories (categories#index)" do
it "can access an individual category's page and items (categories#show)"
"can access the page showing all items (items#index)"
"can access one item's page (items#show)"
"can access the page with all their orders (orders#index)" #won't need
"can create an order (orders#create)"
"can access an order's show page (orders#show)"
"can log in (sessions#new)"
"can access log in (sessions#create)"
"can access log out (sessions#destroy)"
"can access a store's page (stores#show)"
"can access the new account page (users#new)"
"can create a new account (users#create)"
"can access a user's dashboard (users#show)"
"can access the platform admin's dashboard (platform_admin/dashboard#show)"
"can access the platform admin's dashboard (platform_admin/dashboard#index)" # won't need
"can create a new item (items#create)"
"can access the edit item page (items#edit)"
"can edit an item (items#update)"
"can update the status of an order (orders#update)"
"can create a new store (stores#create)"
"can update a store's information (stores#update)"



