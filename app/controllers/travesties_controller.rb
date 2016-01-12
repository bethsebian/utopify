class TravestiesController < ApplicationController

  def show
    @travesty = Travesty.find(params[:id])
  end

end
