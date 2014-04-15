require 'spec_helper'

describe Tweet do
  it "should be able to post a new tweet" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit user_path(user)
    tweet = FactoryGirl.build(:tweet)
    fill_in 'tweet-box', with: tweet.text
    click_button 'Create Tweet'
    page.should have_content "#{user.name} added a tweet"
  end
  it "should delete a tweet" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit user_path(user)
    tweet = FactoryGirl.build(:tweet)
    fill_in 'tweet-box', with: tweet.text
    click_button 'Create Tweet'
    click_link 'Delete'
    page.should have_no_content "#{tweet.text}"
  end

end
