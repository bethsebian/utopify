class DashboardController < ApplicationController

  def index
    @store = Store.find_by_slug(params["store_slug"])
  end

end
