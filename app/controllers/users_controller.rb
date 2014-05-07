class UsersController < ApplicationController
  def new
    @user = User.new
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
