class DashboardController < ApplicationController
  def index
    binding.pry
    @store = Store.find_by_slug(params["store_slug"])
  end
end
