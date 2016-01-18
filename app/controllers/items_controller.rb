class ItemsController < ApplicationController

  def index
    @items = Item.all
    @travesties = Travesty.all.distinct
  end

  def show
    @item = Item.find(params[:id])
  end

end
