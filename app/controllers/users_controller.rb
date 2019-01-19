class UsersController < ApplicationController
  # signup GET /signup(.:format) users#new
  def new
  end
  # users POST /users(.:format) users#create
  def create
    
    user = User.new(user_params)

    if User.find_by(email: user.email)
      redirect_to '/signup', notice: "Email is already used !!!"
    else
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup', notice: "Email is already used !!!"
      end
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
