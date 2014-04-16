require 'spec_helper'

describe Tweet do

  it { should belong_to :user }
  it { should validate_presence_of :text }
  it { should ensure_length_of(:text).
            is_at_least(3).
            is_at_most(150) }

  it 'searches for a user in a tweet and returns the user' do
    test_user = FactoryGirl.create(:user)
    test_tweet = Tweet.create({ text: "lalalallalalalallal dhsdkjfhsdjf kdjfksdjf
                                      #{test_user.username}",
                                user_id: 8 })
    test_tweet.check_for_user.should eq [test_user]
  end


end
