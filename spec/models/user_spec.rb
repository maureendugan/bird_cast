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

end
