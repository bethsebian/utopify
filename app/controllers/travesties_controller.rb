class TravestiesController < ApplicationController

  def show
    @travesty = Travesty.find_by(title: params[:slug])
  end

end
