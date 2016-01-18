class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.all
    @user = current_user
  end

  def new
    @item = Item.new
    @user = current_user
  end

  def create
    @travesty = Travesty.find(params[:item][:travesty_id])
    @item = @travesty.items.create(item_params)
    redirect_to admin_items_path
  end

  def show
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(
      :title,
      :description,
      :price,
      :image_url,
      :travesty_id
      )
  end
end
