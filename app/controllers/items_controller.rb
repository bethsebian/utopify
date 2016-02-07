class ItemsController < ApplicationController

  def index
    @items = Item.all
    @travesties = Travesty.all.distinct
  end

  def show
    @item = Item.find(params[:id])
    @related_items = Item.where(category_id: @item.category_id).last(3)
  end

end
