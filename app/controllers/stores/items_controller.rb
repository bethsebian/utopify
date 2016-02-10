# class Stores::ItemsController < ApplicationController
#   def show
#     @item = Item.find_by(id: params[:id])
#     @related_items = @item.category.items.where(store_id: @item.store_id).last(3)
#   end
#
#   def destroy
#     item = Item.find_by(id: params[:id])
#     item.delete
#   end
# end
