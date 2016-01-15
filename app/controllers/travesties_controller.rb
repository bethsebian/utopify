class TravestiesController < ApplicationController

  def show
    @travesty = Travesty.find_by_slug(params[:slug])
  end

end
