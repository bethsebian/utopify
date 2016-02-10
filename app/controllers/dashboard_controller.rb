class DashboardController < ApplicationController

  def index
    if current_user && (current_user.store == Store.find_by_slug(params["store_slug"]))
      @store = current_user.store
      @orders = @store.orders
    elsif current_user && current_user.platform_admin?
      @store = Store.find_by_slug(params["store_slug"])
      @orders = @store.orders
    else
      redirect_to 'public/404'
    end
  end
end
