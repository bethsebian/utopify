class TravestiesController < ApplicationController

  def show
    @travesty = Travesty.find(params[:slug])
  end

end
