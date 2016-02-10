class StoresController < ApplicationController
  def show
    @store = Store.find_by_slug(params[:slug])
    @top_sellers = @store.items.first(3)
    @items = @store.items
  end

  def dashboard
    render :dashboard
  end

  def update
    store = Store.find_by(slug: params[:slug])
    store.update_attributes(store_params)
    store.status = "active"
    if current_user.platform_admin? && store.save
      flash[:success] = {color: "white", message: "Store #{store.title} has been successfully created and approved"}
      redirect_to platform_admin_dashboard_index_path
    else
      flash[:error] = { color: "white", message: store.errors.full_messages.join(", ") }
      redirect_to platform_admin_dashboard_index_path
    end
  end

  private
  def store_params
    params.require(:store).permit(:title, :description, :image_url, :accreditations)
  end
end
