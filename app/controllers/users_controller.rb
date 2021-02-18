class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path,
    notice: " , You Have Successfully Registered as "
    else
      render 'new',
      alert:  'Registration Unsuccessful Something went wrong, Please Try Again'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
