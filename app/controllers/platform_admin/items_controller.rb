class PlatformAdmin::ItemsController < PlatformAdminController
	def create
		
	end
end


# def create
# 	# current_user.store.items.new(item_params)
#
# 	item = Item.new(item_params)
# 	if current_user.store
# 		item.store_id = current_user.store.id
# 	else
# 		item.store_id = Store.first.id
# 	end
# 	item.price = params[:item][:price].to_i
# 	item.category_id = params[:item][:category].to_i
# 	if item.save
# 		flash[:success] = {color: "white", message: "Your item was successfully created"}
# 		if current_user.platform_admin?
# 			redirect_to new_item_path
# 		else
# 			redirect_to new_store_item_path(current_user.store.slug)
# 		end
# 	else
# 		flash[:error] = {color: "white", message: item.errors.full_messages.join(", ")}
# 		redirect_to action: "new"
# 	end
# end
