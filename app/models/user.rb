class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  has_many :tweets

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self)
  end

  def send_confirmation_message
    UserMailer.mention_confirmation(self)
  end

end
