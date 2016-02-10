class PlatformAdmin::DashboardController < ApplicationController
  def show
  end

  def index
    @categories = Category.all
    @pending_stores = Store .where(status: "pending")
    @active_stores = Store .where(status: "active")
  end
end
