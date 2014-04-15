def sign_in(user)
  visit login_path
  fill_in 'username', with: user.username
  fill_in 'password', with: user.password
  click_button "Log In"
end

def create_sign_in_user_create_tweet(tweet)
  user = FactoryGirl.create(:user)
  sign_in(user)
  visit user_path(user)
  fill_in 'tweet-box', with: tweet.text
  click_button 'Create Tweet'
end
