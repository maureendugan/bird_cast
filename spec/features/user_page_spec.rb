require 'spec_helper'

describe User do
  it 'allows a new user to create an account' do
    visit new_user_path
    user = FactoryGirl.build(:user)
    fill_in :user_name, with: user.name
    fill_in :user_username, with: user.username
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    fill_in :user_email, with: user.email
    click_button "Create User"
    page.should have_content "Your account has been created"
  end

  it 'allows a user to sign in with corrent credentials' do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_button 'Log In'
    page.should have_content "Logged In"
  end

  it 'logs out a user' do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_button 'Log In'
    click_link 'Log Out'
    page.should have_content "Logged Out"
  end
end
