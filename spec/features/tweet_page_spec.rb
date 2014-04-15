require 'spec_helper'

describe Tweet do
  it "posts a new tweet" do
    tweet = FactoryGirl.build(:tweet)
    create_sign_in_user_create_tweet(tweet)
    page.should have_content "#{tweet.text}"
  end
  it "deletes a tweet" do
    tweet = FactoryGirl.build(:tweet)
    create_sign_in_user_create_tweet(tweet)
    click_link 'Delete'
    page.should have_no_content "#{tweet.text}"
  end

end
