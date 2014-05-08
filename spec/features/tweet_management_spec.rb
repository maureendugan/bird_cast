require 'spec_helper'

feature 'User manages tweets' do

  scenario 'lets an authorized user post a new tweet' do
    sign_in(FactoryGirl.create(:user, username: 'Ernest'))

    fill_in 'tweet-box', with: 'This is a great tweet'
    click_button 'Create Tweet'
    page.should have_content 'Ernest This is a great tweet'
  end

  scenario 'user deletes their own tweet' do
    sign_in(FactoryGirl.create(:user, username: 'Evelyn'))

    fill_in 'tweet-box', with: 'this tweet should be deleted'
    click_button 'Create Tweet'
    click_link 'Delete'
    page.should_not have_content 'Evelyn this tweet should be deleted'
  end
end
