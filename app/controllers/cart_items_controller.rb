class CartItemsController < ApplicationController
	include ActionView::Helpers::TextHelper

	def create
		item = Item.find(params[:item_id])
		@cart.add_item(item.id)
		session[:cart] = @cart.contents
		flash[:notice] = "You have #{pluralize(@cart.count_of, "item")} in your cart."
		redirect_to '/items'
	end


end
