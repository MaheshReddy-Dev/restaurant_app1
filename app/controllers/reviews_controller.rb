class ReviewsController < ApplicationController
  before_action :set_reviewable

  def create
    @review = @reviewable.reviews.new(review_params)
    if @review.save
      redirect_to @reviewable, notice: "Review submitted successfully."
    else
    if @reviewable.is_a?(Restaurant)
      render "restaurants/show"
    else
    render "dishes/show"
    end
    end
  end

  private

  def set_reviewable
  if params[:restaurant_id]
      @reviewable = Restaurant.find(params[:restaurant_id])
    else
      @reviewable = Dish.find(params[:dish_id])
    end
  end

  def review_params
      params.require(:review).permit(:rating, :content)
  end
end