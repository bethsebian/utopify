class ItemsController < ApplicationController

  def index
    @items = Item.where(active: true)
  end

  def show
    @item = Item.find_by_slug(params[:slug])
    @related_items = Item.where(category_id: @item.category_id).last(3)
  end

  def new
    @item = Item.new
  end

  def create
    # current_user.store.items.new(item_params)

    item = Item.new(item_params)
    if current_user.store
      item.store_id = current_user.store.id
    else
      item.store_id = Store.first.id
    end
    item.price = params[:item][:price].to_i
    item.category_id = params[:item][:category].to_i
    if item.save
      flash[:success] = {color: "white", message: "Your item was successfully created"}
      if current_user.platform_admin?
        redirect_to new_item_path
      else
        redirect_to new_store_item_path(current_user.store.slug)
      end
    else
      flash[:error] = {color: "white", message: item.errors.full_messages.join(", ")}
      redirect_to action: "new"
    end
  end




  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    if item.save
      flash[:success] = {color: "white", message: "Your item was successfully edited"}
      redirect_to store_dashboard_index_path(item.store.slug)
    else
      flash[:error] = {color: "white", message: item.errors.full_messages.join(", ")}
      redirect_to action: "edit"
    end
  end

  def destroy
    item = Item.find_by_slug(params[:slug])
    item.active = false
    item.save
    redirect_to store_dashboard_index_path(item.store.slug)
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :image_url)
  end
end
