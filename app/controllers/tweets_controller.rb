class TweetsController < ApplicationController
  def create
    @tweet = Tweet.new(tweet_params)
    @user = current_user
    if @tweet.save
      user_mail = @tweet.check_for_user
      if !user_mail.nil?
        user_mail.each do |message|
          UserMailer.mention_confirmation(message).deliver
        end
      end
      current_user.tweets << @tweet
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js { render 'create' }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render 'create' }
      end
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
