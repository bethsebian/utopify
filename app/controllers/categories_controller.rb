class CategoriesController < ApplicationController

  def index
    @items = Item.all
    @categories = Category.all.distinct
  end

  def show
    @category = Category.find_by_slug(params[:slug])
  end

end
