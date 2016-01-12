class SessionsController < ApplicationController

  def show
    @cart_items = session[:cart].map {|id, num| [Item.find(id), num]}
  end

end
