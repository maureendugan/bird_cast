class UserMailer < ActionMailer::Base
  default from: "admin-birdcast@example.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Thank You for Joining the Flock!"
  end

  def mention_confirmation(user)
    @user = user
    mail to: user.email, subject: "Someone Tweeted About You!"
  end
end
