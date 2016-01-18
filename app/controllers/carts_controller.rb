class CartsController < ApplicationController

	def checkout
		if current_user.nil?
			flash[:login] = {color: 'red', message: "Please log in to check out}"}
			redirect_to '/login'
		else
			order = current_user.orders.create(
				status: "ordered",
				total_price: total_price
			)
			add_items_to_order
			flash[:order_success] = {color: 'green', message: "Order was successfully placed}"}
			redirect_to orders_path
		end
	end

private

	def total_price
		$1500
	end

	def add_items_to_order
		@cart.items.map do |item|
		end
	end
end

