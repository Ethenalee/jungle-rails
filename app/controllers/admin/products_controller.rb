class Admin::ProductsController < Admin::BaseController
  # route: admin_products GET /admin/products(.:format) admin/products#index
  def index
    @products = Product.order(id: :desc).all
  end
  # route: new_admin_product GET /admin/products/new(.:format) admin/products#new
  def new
    @product = Product.new
  end
  # route: admin_products POST /admin/products(.:format) admin/products#create
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end
  # route: admin_product DELETE /admin/products/:id(.:format) admin/products#destroy
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
