require 'spec_helper'

feature 'User authentication' do
  scenario 'new user creates an account' do
    visit '/'
    click_link 'Sign Up'
    fill_in :user_name, with: 'Ernie'
    fill_in :user_username, with: 'Ernie'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    fill_in :user_email, with: 'ernie@email.com'
    click_button "Create User"
    page.should have_content "Your account has been created"
  end

  it 'allows a user to sign in with corrent credentials' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    page.should have_content "Logged In"
  end

  it 'logs out a user' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_link 'Log Out'
    page.should have_content "Logged Out"
  end
end
