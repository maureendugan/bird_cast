require 'spec_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :username }
  it 'should validate uniquiness of username' do
    FactoryGirl.create(:user)
    should validate_uniqueness_of :username
  end

  it { should have_secure_password }
  it { should validate_presence_of :email }
  it 'sends a welcome email to a new user' do
    user = FactoryGirl.create(:user)
    ActionMailer::Base.deliveries.last.to.should eq [user.email]
  end

  it 'sends a mention email when a user is mentioned in a tweet' do
    user = FactoryGirl.create(:user)
    tweet = Tweet.create({ text: "lalalallalalalallal dhsdkjfhsdjf kdjfksdjf
                                      @#{user.username}",
                                user_id: 8 })
    tweet.check_for_user
    ActionMailer::Base.deliveries.last.to.should eq [user.email]
  end

  it { should have_many :tweets }


  it { should respond_to(:relationships) }

end
