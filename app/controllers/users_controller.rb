require 'pry'
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    binding.pry
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your account has been created!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem creating your account"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @tweet = Tweet.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Your account was updated!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem updating your account"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Your account was deactivated!"
    redirect_to root_path
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
