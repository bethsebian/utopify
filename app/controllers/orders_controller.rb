class OrdersController < ApplicationController
  before_action :validate_user

  def validate_user
    if current_user.nil?
      flash[:login] = {color: 'red', message: "Please log in to check out"}
      redirect_to '/login'
    end
  end

  def index
    @orders = current_user.orders
  end

  def create
    if current_user.nil?
      flash[:login] = {color: 'red', message: "Please log in to check out"}
      redirect_to '/login'
    else
      @order = current_user.orders.create(
        status: "ordered",
        total_price: total_price
      )
      add_items_to_order
      flash[:order_success] = {color: 'green', message: "Order was successfully placed"}
      set_doomsday_flash_message
      redirect_to orders_path
      session[:cart] = {}
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    @items = @order.order_items
  end

  private

  def set_doomsday_flash_message
    if current_user && current_user.total_purchased >= 50000
      flash_link = "#{view_context.link_to 'Doomsday', doomsday_path}"
      flash[:alert] = {color: 'red', message: "Doomsday Hath Commeth: #{flash_link} "}
    end
  end

  def total_price
    @cart.total_price
  end

  def add_items_to_order
    @cart.contents.each do |item_id, qty|
      item = Item.find(item_id)
      @order.order_items.create(
        item_id: item_id,
        item_quantity: qty,
        item_price: item.price
      )
    end
  end
end
