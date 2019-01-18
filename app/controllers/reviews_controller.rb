class ReviewsController < ApplicationController
  def create
    puts rating_params
  end

  private
  def rating_params
    params.require(:rating).permit(:product, :user, :description, :rating)
  end

end