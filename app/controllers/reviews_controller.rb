class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @item = Item.find(params[:item_id])
    @review = Review.create(review_params)
    current_user.reviews << @review
    @item.reviews << @review
    redirect_to item_path(@item)
  end

  private

  def review_params
    params.require(:review).permit(:text)
  end

end
