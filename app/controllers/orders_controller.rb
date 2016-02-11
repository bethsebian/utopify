class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper
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
    @order = current_user.orders.create(status: "ordered",
                                        total_price: @cart.total_price)
    add_items_to_order
    flash[:order_success] = {color: 'green', message: "Order was successfully placed."}
    session[:cart] = {}
    redirect_to '/dashboard'
  end

  def show
    @order = Order.find(params[:id]) if current_user.store_admin?
    @order = current_user.orders.find(params[:id]) if current_user.default?
    @items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    redirect_to admin_orders_path
  end

  private

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
