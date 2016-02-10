class ItemsController < ApplicationController

  def index
    @items = Item
  end

  def show
    @item = Item.find_by_slug(params[:slug])
    @related_items = Item.where(category_id: @item.category_id).last(3)
  end

  def update
    item = Item.find_by_slug(params[:slug])
    item.update_attributes(active: params[:new_status])
    redirect_to store_dashboard_index_path(item.store.slug)
  end

  def destroy
    item = Item.find_by_slug(params[:slug])
    item.delete
    redirect_to store_dashboard_index_path(item.store.slug)
  end
end
