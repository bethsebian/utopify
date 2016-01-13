class TravestiesController < ApplicationController

  def show
    @travesty = Travesty.find_by(slug: params[:slug])
  end

end
