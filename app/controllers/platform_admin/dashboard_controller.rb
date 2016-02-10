class PlatformAdmin::DashboardController < ApplicationController
  def show
  end

  def index
    @categories = Category.all
    @pending_stores = Store .where(status: "pending")
  end
end
