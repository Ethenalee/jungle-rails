class SessionsController < ApplicationController
  #route: login GET /login(.:format) sessions#new
  def new
  end
  #route: POST /login(.:format) sessions#create
  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
       redirect_to '/login'
    end
  end
  # route:  logout GET /logout(.:format) sessions#destroy
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
