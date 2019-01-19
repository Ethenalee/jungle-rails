class Admin::CategoriesController < Admin::BaseController
  # route: admin_products GET /admin/products(.:format) admin/products#index
  def index
    @categories = Category.order(id: :desc).all
  end
  # route: new_admin_product GET /admin/products/new(.:format) admin/products#new
  def new
    @category = Category.new
  end
  # route: admin_products POST /admin/products(.:format) admin/products#create
  def create
    @category = Category.new(category_params)
    if @category.save
        redirect_to [:admin, :categories], notice: 'Category created!'
    else
        render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
