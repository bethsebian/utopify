class StoresController < ApplicationController
  def show
    @store = Store.find_by_slug(params[:slug])
    @top_sellers = @store.items.first(3)
    @items = @store.items
  end

  def new
    @store = Store.new
  end

  def create
    @store = current_user.stores.create(store_params)
    @store.status = "pending"
    @store.save
    flash[:notice] = {color: "green", message: "#{@store.title} has been submitted for review."}
    redirect_to root_path
  end

  def dashboard
    render :dashboard
  end

  def update
    store = Store.find_by(slug: params[:slug])
    store.update_attributes(store_params)
    store.status = params[:store][:status]
    if current_user.platform_admin? && store.save
      if store.status == "active"
        flash[:success] = {color: "white", message: "Store #{store.title} has been successfully created and approved"}
      elsif store.status == "declined"
        flash[:success] = {color: "white", message: "Store #{store.title} has been successfully declined"}
      end
      redirect_to platform_admin_dashboard_index_path
    else
      flash[:error] = { color: "white", message: store.errors.full_messages.join(", ") }
      redirect_to platform_admin_dashboard_index_path
    end
  end

  def store_params
    params.require(:store).permit(:title, :description, :image_url, :accreditations)
  end
end
