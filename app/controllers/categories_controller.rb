class CategoriesController < ApplicationController

  def index
    @items = Item.all
    @categories = Category.all.distinct
  end

  def show
    @items = Category.find_by_slug(params[:slug]).items
    @category = @items.first.category
  end

  def edit
    @category = Category.find_by(slug: params[:slug])
  end

  def update
    category = Category.find_by(slug: params[:slug])
    category.update_attributes(category_params)
    if category.save
      flash[:success] = {color: "white", message: "Your category was successfully edited"}
      redirect_to platform_admin_dashboard_index_path
    else
      flash[:error] = {color: "white", message: category.errors.full_messages.join(", ")}
      redirect_to action: "edit"
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :image_url)
  end
end
