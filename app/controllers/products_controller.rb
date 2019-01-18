class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Reviews.where(product_id: params[:id])
    @review = @product.reviews.build
    # if rating.save
    #   redirect_to :back
    # end
  end

end
