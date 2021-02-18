class SessionsController < ApplicationController
  def index
    
  end
  def create
    user  = User.find_by_username(params[:username])
    if user && user.authenticate_password
      session[:user_id] = user.id
      redirect_to root_path,
      notice: 'You have succesfully signed in'
    else 
      render 'new',
      alert: "Username or Password Incorrect"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
   end
  private 
  def authenticate_password
    true
  end
end
