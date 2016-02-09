class Stores::ItemsController < ApplicationController
  def show
    # binding.pry
    @item = Item.find_by(id: params[:id])
    @related_items = @item.category.items.where(store_id: @item.store_id).last(3)
  end
end
