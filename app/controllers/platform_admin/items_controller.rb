class PlatformAdmin::ItemsController < PlatformAdminController
	def new
		@item = Item.new
		@url = platform_admin_items_path
		render '/items/new'
	end

	def create
    item = Item.new(item_params)
    item.store = Store.find_by_slug(params[:store_slug])
    if item.save
      flash[:success] = {color: "white", message: "Your item was successfully created"}
			redirect_to store_dashboard_index_path(store_slug: params[:store_slug])
    else
      flash[:error] = {color: "white", message: item.errors.full_messages.join(", ")}
      redirect_to action: "new"
    end
	end

	private

	def item_params
		params.require(:item).permit(:title, :description, :image_url)
	end
end
