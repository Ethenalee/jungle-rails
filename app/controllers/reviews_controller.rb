class ReviewsController < ApplicationController
  
  before_filter :authenticate

  def create
    @product = Product.find params[:product_id] 
    @review = @product.reviews.create(review_params)
    if @review.save
        redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :user_id, :description, :rating)
  end

  def authenticate
    current_user
  end

end