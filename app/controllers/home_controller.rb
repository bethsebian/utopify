class HomeController < ApplicationController

  def index
    @items = Item.all.first(12)
  end

end
