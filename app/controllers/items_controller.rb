class ItemsController < ApplicationController

  def index
    @items = Item.all
    @travesties = Travesty.all.distinct
  end

  def show
    @item = Item.find_by_slug(params[:slug])
    @related_items = Item.where(category_id: @item.category_id).last(3)
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.store_id = current_user.store.id
    item.price = params[:item][:price].to_i
    item.category_id = params[:item][:category].to_i
    if item.save
      redirect_to store_dashboard_index_path(current_user.store.slug)
    else
      flash[:error] = item.errors.full_messages.join(", ")
      redirect_to action: "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :image_url)
  end
end
