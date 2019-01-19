class Admin::CategoriesController < Admin::BaseController
  # route: admin_categories GET /admin/categories(.:format) admin/categories#index
  def index
    @categories = Category.order(id: :desc).all
  end
  # route: new_admin_category GET /admin/categories/new(.:format) admin/categories#new
  def new
    @category = Category.new
  end
  # route: admin_categories  POST /admin/categories(.:format) admin/categories#create
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
