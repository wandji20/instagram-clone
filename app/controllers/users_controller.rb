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
      redirect_to root_path,
      notice: " #{@user.name}, You Have Successfully Registered as #{@user.username}"
    else
      render 'new'
      # alert: 'Something went wrong, Please Try Again'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
