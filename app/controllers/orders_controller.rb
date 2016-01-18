class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.order_items
  end
end
