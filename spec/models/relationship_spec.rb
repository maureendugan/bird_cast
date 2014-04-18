require 'spec_helper'

describe Relationship do

  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id)}

  subject { relationship }
  it { should be_valid }

  it 'creates a relationship between two users' do
    user_follower = FactoryGirl.create(:user)
    user_followed = FactoryGirl.create(:user)
    user_follower.relationships.create(followed_id: user_followed.id)
    Relationship.find_by_follower_id(user_follower.id).followed_id.should eq user_followed.id
  end

  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should eq follower }
    its(:followed) { should eq followed }
  end

  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end

end
