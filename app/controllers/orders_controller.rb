class OrdersController < ApplicationController

  def index
    @orders = Order.find_by(user_id: session[:user_id])
  end

end
