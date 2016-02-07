class StoresController < ApplicationController
  def show
    @store = Store.find_by_slug(params[:slug])
    @top_sellers = @store.items.first(3)
    @items = @store.items
  end
end
