class User < ActiveRecord::Base
  has_secure_password

  has_many :relationships, foreign_key: "follower_id"

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  has_many :tweets
  has_many :followed_users, through: :relationships, source: :followed

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end

  def send_confirmation_message
    UserMailer.mention_confirmation(self).deliver
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

end
