class SessionsController < ApplicationController
  #route: login GET /login(.:format) sessions#new
  def new
  end
  #route: POST /login(.:format) sessions#create
  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
       redirect_to '/login', notice: "Woops !  email or password is not valid"
    end
  end
  # route:  logout GET /logout(.:format) sessions#destroy
  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "You are successfully logged out"
  end
end
