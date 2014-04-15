class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :text, presence: true, length: {minimum: 3, maximum: 150}
end
