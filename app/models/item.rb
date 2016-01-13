class Item < ActiveRecord::Base
  belongs_to :travesty

  def create
    Item.create(params[:item_params])
  end

private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url, :travesty_id)
  end
end