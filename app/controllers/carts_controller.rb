class CartsController < ApplicationController

	def checkout
		if current_user.nil?
			flash[:login] = {color: 'green', message: "Please log in to check out}"}
			redirect_to '/login'
		else
			order = Order.create(@cart)
		end
	end

end
