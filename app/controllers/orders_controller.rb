class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def create
    if current_user.nil?
      flash[:login] = {color: 'red', message: "Please log in to check out}"}
      redirect_to '/login'
    else
      @order = current_user.orders.create(
        status: "ordered",
        total_price: total_price
      )
      add_items_to_order
      flash[:order_success] = {color: 'green', message: "Order was successfully placed}"}
      redirect_to orders_path
    end
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.order_items
  end

  private

  def total_price
    @cart.total_price
  end

  def add_items_to_order
    @cart.contents.each do |item_id, qty|
      item = Item.find(item_id)
      @order.order_items.create(item_id: item_id,
                         item_quantity: qty,
                         item_price: item.price
                         )
    end
  end
end
