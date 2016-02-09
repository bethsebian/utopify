class CartItemsController < ApplicationController
	include ActionView::Helpers::TextHelper
	include ActionView::Helpers::UrlHelper

	def create
		item = Item.find(params[:item_id])
		item_quantity = params[:cart_item][:quantity].to_i
		item_quantity.times do
			@cart.add_item(item.id)
		end
		session[:cart] = @cart.contents
		flash[:notice] = {color: "white", message: "You have #{pluralize(@cart.count_of, "item")} in your cart."}
		redirect_to :back
	end

	def destroy
		@item = Item.find(params[:id])
		flash_link = "#{view_context.link_to @item.title, store_item_path(@item.store_id, @item.id)}"
		flash[:success] = {color: "green", message: "Successfully removed #{flash_link} from your cart."}
		@cart.delete_item(params[:id])
		redirect_to cart_path
	end

	def update
		@cart.update_quantity(params[:qty_update_data])
		@item = Item.find(params[:id])
		flash_link = "#{view_context.link_to @item.title, store_item_path(@item.store_id, @item.id)}"
		flash[:success] = {color: "green", message: "Successfully updated #{flash_link} quantity in your cart." }
		redirect_to cart_path
	end
end
