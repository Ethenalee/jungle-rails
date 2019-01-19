class CategoriesController < ApplicationController
  #route: category GET /categories/:id(.:format) categories#show
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
