class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      current_user.tweets << @tweet
      flash[:notice] = "#{current_user.name} added a tweet."
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to user_path(current_user)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
