class ReviewsController < ApplicationController
  # check login or not 
  before_filter :authenticate
  # route: product_reviews POST /products/:product_id/reviews(.:format) reviews#create
  def create
    @product = Product.find params[:product_id] 
    @review = @product.reviews.create(review_params)
    if @review.save
        redirect_to :back
    end
  end
  # route: product_review DELETE /products/:product_id/reviews/:id(.:format) reviews#destroy
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