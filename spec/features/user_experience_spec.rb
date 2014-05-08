require 'spec_helper'

feature 'user follows another user' do

  scenario 'anonymous user is directed to sign up in order to follow' do
    FactoryGirl.create(:user, username: "Ezra", id: 45)

    visit "users/45"
    click_link "Create Account to Follow Ezra"
    page.should have_content "Sign Up for a Bird Cast Account!"
  end

end
