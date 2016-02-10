class PlatformAdmin::DashboardController < ApplicationController
  def show
  end

  def index
    @categories = Category.all
  end
end
