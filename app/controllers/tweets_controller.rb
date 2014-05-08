class TweetsController < ApplicationController
  def create
    current_user.tweets << Tweet.create(tweet_params)
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js { render 'create' }
    end
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
