class Admin::OrdersController < Admin::BaseController
	def index
		@orders = OrderDigest.new
		@statuses = Order.pluck(:status).uniq.compact
	end

end