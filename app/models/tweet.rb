class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :text, presence: true, length: {minimum: 3, maximum: 150}

  def check_for_user
    users = User.all.select { |user| self.text.match(user.username) }
    users.each do |user|
      user.send_confirmation_message
    end
    users
  end


end




