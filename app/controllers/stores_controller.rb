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

  private

  def store_params
    params.require(:store).permit(:title, :description, :image_url, :accreditations)
  end
end
