class ProductsController < ApplicationController
  # route: product GET /products/:id(.:format) products#show
  def index
    @products = Product.all.order(created_at: :desc)
  end
  # route: products GET /products(.:format) products#index
  def show
    @product = Product.find params[:id]
    # added to shows reviews in product 
    @reviews = Review.where(product_id: params[:id]).order(created_at: :desc)
    @review = @product.reviews.build
  end

end
