class SessionsController < ApplicationController

  def show
    @cart_items = session[:cart].map {|id, num| [Item.find(id), num]}
    @total_price = total_price
  end

  private

  def total_price
    @cart_items.sum do |item, num|
      item.price
    end
  end

end
