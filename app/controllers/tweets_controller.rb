class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @user = current_user
    if @tweet.save
      current_user.tweets << @tweet
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render 'create' }
      end
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet_id = @tweet.id
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
