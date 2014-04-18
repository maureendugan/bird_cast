require "spec_helper"

describe UserMailer do
  describe "signup_confirmation" do
    user = FactoryGirl.build(:user)
    let(:mail) { UserMailer.signup_confirmation(user) }

    it "renders the headers" do
      user.save
      mail.subject.should eq("Thank You for Joining the Flock!")
      mail.to.should eq(["#{user.email}"])
      mail.from.should eq(["admin-birdcast@example.com"])
    end

    it "renders the body" do
      user.save
      mail.body.encoded.should match("Dear")
    end
  end

  describe "mention_confirmation" do
    user = FactoryGirl.build(:user)
    let(:mail) { UserMailer.mention_confirmation(user) }

    it "renders the headers" do
      user.save
      mail.subject.should eq("Someone Tweeted About You!")
      mail.to.should eq(["#{user.email}"])
      mail.from.should eq(["admin-birdcast@example.com"])
    end

    it "renders the body" do
      user.save
      mail.body.encoded.should match("Dear")
    end
  end
end
