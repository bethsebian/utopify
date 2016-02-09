class DashboardController < ApplicationController
  def index
    @orders = Store.orders
    @store = Store.find_by_slug(params["store_slug"])
  end
end
