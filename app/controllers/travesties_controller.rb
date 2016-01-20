class TravestiesController < ApplicationController

  def index
    @items = Item.all
    @travesties = Travesty.all.distinct
  end

  def show
    @travesty = Travesty.find_by_slug(params[:slug])
  end

end
