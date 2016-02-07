class HomeController < ApplicationController

  def index
    @items = Item.all.first(12)
    @top_categories = Category.top_three
  end

  def search
    @items = Item.where(active: params["params"]["active"])
    respond_to do |format|
      format.js
    end
  end
end
