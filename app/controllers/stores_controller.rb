class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
    @top_sellers = @store.items.first(3)
    @items = @store.items
  end
end
