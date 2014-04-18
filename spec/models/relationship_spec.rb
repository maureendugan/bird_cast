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
    # Relationship.create({follower_id: user_follower.id, followed_id: user_followed.id})
    user_follower.relationships.create(followed_id: user_followed.id)
    Relationship.find_by_follower_id(user_follower.id).followed_id.should eq user_followed.id
  end
end
