class PlatformAdmin::DashboardController < ApplicationController
  def show
  end

  def index
    @categories = Category.all
    @stores = Store.all
    # @declined_stores = Store .where(status: "declined")
    # @pending_stores = Store.where(status: "pending")
    # @active_stores = Store.where(status: "active")
  end

end
