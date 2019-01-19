class Admin::DashboardController < Admin::BaseController

  # route: admin_root GET  /admin(.:format) admin/dashboard#show
  def show
    @users = User.all
    @orders = Order.all
  end

end
