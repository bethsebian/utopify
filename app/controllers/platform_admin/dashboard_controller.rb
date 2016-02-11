class PlatformAdmin::DashboardController < ApplicationController
  def show
  end

  def index
    @categories = Category.all
    @stores = Store.all
  end

end
