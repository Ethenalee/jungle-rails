class ReviewsController < ApplicationController
  
  def create
    @product = Product.find params[:product_id] 
    @review = @product.reviews.create(review_params)
    if @review.save
        redirect_to :back
    end
  end

  private
  def review_params
    params.require(:review).permit(:product_id, :user_id, :description, :rating)
  end

end