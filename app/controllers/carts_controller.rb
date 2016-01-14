class CartsController < ApplicationController

  def show
  end

  def update
    @cart.contents[params[:cart_items][:item_id]]=params[:cart_items][:quantity].to_i # change to update_quantity
    redirect_to '/cart'
  end

end
